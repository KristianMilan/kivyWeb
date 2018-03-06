from kivy.app import App
from kivy.lang import Builder

kv = '''
Button:
    text: 'push me!'
'''

class ServiceApp(App):
    def build(self):
        from service import main
        # main.start_web()
        return Builder.load_string(kv)


if __name__ == '__main__':
    ServiceApp().run()