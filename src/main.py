import sys
import thread
import webbrowser
import time

import BaseHTTPServer, SimpleHTTPServer

try:
    port = sys.argv[1]
except IndexError:
    port = 4004

url = 'http://localhost:' + str(port)

def start_server():
    httpd = BaseHTTPServer.HTTPServer(('localhost', int(port)), SimpleHTTPServer.SimpleHTTPRequestHandler)
    httpd.serve_forever()

thread.start_new_thread(start_server,())
webbrowser.open_new(url)

while True:
    try:
        time.sleep(1)
    except KeyboardInterrupt:
        sys.exit(0)