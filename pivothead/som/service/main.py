import threading

from bottle import Bottle, route, static_file, ServerAdapter, get, redirect, template, TEMPLATE_PATH
import os
import traceback

from kivy.clock import mainthread

import LogManager

TEMPLATE_PATH.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "assets/views")))
WEB_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), "assets"))

def pivot_auth(check, realm="private", text="Access denied"):
    def decorator(func):
        def wrapper(*a, **ka):
            from bottle import request
            # s = request.environ.get('beaker.session')
            # password = s.get('web_passwd', None)
            # user = 'P!vothead'
            return func(*a, **ka)
        return wrapper
    return decorator

def check_auth(username, password):
    return True

@route('/hello')
@pivot_auth(check_auth)
def helloworld():
    return 'Hello Osen'

@route('/')
@pivot_auth(check_auth)
def webSetup():
    redirect('/device')

@route('/__exit', method=['GET','HEAD'])
def exit():
    global server
    server.stop()

@route('/device', check_auth=check_auth)
@pivot_auth(check_auth)
def deviceSetting():
    mac = None
    try:
        serial = 'LMD60301A0001'
    except:
        pass
    try:
        mac = '00:00:00:00:00:00'
    except:
        pass
    ip = ""
    frequency = "2.4"

    sipServer = 'sip.pivothead.tv'

    isBle = False

    isMediaServerRunning = False
    ver=None
    isLicenseValid=False
    glassesIP = ip+":8080"
    # sound
    speakerVol=0
    headphoneVol = 0

    isAutoApp = False
    isAutoFW = False
    isUpgradable=False
    apiAddr = 'Pivothead TV'

    mediaServer = 'Pivothead TV'
    isAvailableApps=False

    ips = None


    isQRScan = False
    isCheckNetwork = False
    isMic = False

    timezone = 'Taipei'
    return template('device_settings.tpl', serial=serial, fwVersion='0001', macAddr=mac, ip=ip, sipServer=sipServer,
                    isBle=isBle, mediaServerLicVer=ver, isMediaServerRunning=isMediaServerRunning, glassesIP=glassesIP,
                    frequency=frequency, isLicenseValid=isLicenseValid, speakerVol=speakerVol, headphoneVol=headphoneVol, isAutoApp=isAutoApp,
                    isAutoFW=isAutoFW, isUpgradable=isUpgradable, mediaServer=mediaServer, apiAddr=apiAddr, isAvailableApps=isAvailableApps,
                    swVersion='0.1', ips=ips, isCheckNetwork=isCheckNetwork, isQRScan=isQRScan, isMic=isMic, timezone=timezone)

'''
resource
'''
@route('/web/<filename:re:.*\.html>')
def htmls(filename):
    return static_file(filename, root=WEB_PATH)

@get('/web/<filename:re:.*\.js>')
def javascripts(filename):
    return static_file(filename, root=WEB_PATH)

@get('/web/css/<filename:re:.*\.css>')
def stylesheets(filename):
    return static_file(filename, root=WEB_PATH+'/css')

@get('/web/images/<filename:re:.*\.(jpg|png)>')
def jpgs(filename):
    return static_file(filename, root=WEB_PATH+'/img')

@get('/web/css/images/<filename:re:.*\.(jpg|png)>')
def cssImages(filename):
    return static_file(filename, root=WEB_PATH+'/img')

@get('/web/<filename:re:.*\.swf>')
def adobeflash(filename):
    return static_file(filename, root=WEB_PATH+'/js')

@get('/web/<filename:re:.*\.xap>')
def silvelight(filename):
    return static_file(filename, root=WEB_PATH+'/js')

@get('/web/fonts/<filename:re:.*\.(otf|eot|svg|ttf|woff|woff2)>')
def fonts(filename):
    return static_file(filename, root=WEB_PATH+'/fonts')

@get('/web/plugins/<filename:re:.*\.(css|png)>')
def webPlugins(filename):
    return static_file(filename, root=WEB_PATH+'/plugins')

def __get_web_root():
    import os
    return os.path.dirname(__file__)


def start_web():
    LogManager.getLogger(True)
    app = Bottle()
    routeDict = {
        '/hello': {'f': helloworld},
        '/': {'f': webSetup},
        '/device': {'f': deviceSetting},
        '/__exit': {'f': exit},
        '/web/images/<filename:re:.*\.(jpg|png)>': {'f': jpgs},
        '/web/<filename:re:.*\.html>': {'f': htmls},
        '/web/<filename:re:.*\.js>': {'f': javascripts},
        '/web/css/<filename:re:.*\.css>': {'f': stylesheets},
        '/web/css/images/<filename:re:.*\.(jpg|png)>': {'f': cssImages},
        '/web/<filename:re:.*\.swf>': {'f': adobeflash},
        '/web/<filename:re:.*\.xap>': {'f': silvelight},
        '/web/fonts/<filename:re:.*\.(otf|eot|svg|ttf|woff|woff2)>': {'f': fonts},
        '/web/plugins/<filename:re:.*\.(css|png)>': {'f': webPlugins},

    }
    for url in routeDict:
        fun = routeDict[url]
        if 'm' in fun:
            app.route(url, method=fun['m'])(fun['f'])
        else:
            app.route(url)(fun['f'])
    try:
        global server
        server = MyWSGIRefServer(host="0.0.0.0", port="8080")
        app.run(server=server, reloader=False)
    except:
        LogManager.getLogger().error(traceback.format_exc())

class MyWSGIRefServer(ServerAdapter):
    server = None

    def run(self, handler):
        from wsgiref import simple_server
        if self.quiet:
            class QuietHandler(simple_server.WSGIRequestHandler):
                def log_request(*args, **kw): pass
            self.options['handler_class'] = QuietHandler
        self.server = simple_server.make_server(self.host, self.port, handler, **self.options)
        self.server.serve_forever()

    def stop(self):
        #sys.stderr.close()
        import threading
        threading.Thread(target=self.server.shutdown).start()
        # self.server.shutdown()
        self.server.server_close() #<--- alternative but causes bad fd exception
        print "# pivothead httpd stop"



if __name__ == '__main__':
    start_web()