import logging
from kivy.logger import Logger

def getLogger(debug=False, fileHandler=None):
    Logger.setLevel(logging.DEBUG)
    if fileHandler!=None:
        Logger.addHandler(fileHandler)
    return Logger
