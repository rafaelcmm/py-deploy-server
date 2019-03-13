import time
import datetime

import BaseHTTPServer, SimpleHTTPServer

def start_server( i, port ):
    httpd = BaseHTTPServer.HTTPServer(('localhost', int(port)), SimpleHTTPServer.SimpleHTTPRequestHandler)
    httpd.serve_forever()

def get_time_diff_to_now( start_time ):
    exec_time_in_seconds = time.time() - start_time
    return time.strftime('%H:%M:%S', time.gmtime(exec_time_in_seconds))