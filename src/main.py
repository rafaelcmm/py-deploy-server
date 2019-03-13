import sys
import thread
import webbrowser
import time

from functions import *

try:
    port = sys.argv[1]
except IndexError:
    port = 4004

url = 'http://localhost:' + str(port)
start_time = time.time()

thread.start_new_thread(start_server,(1,port))
webbrowser.open_new(url)

while True:
    try:
        time.sleep(1)
    except KeyboardInterrupt:
        print("\n\nFinal execution time: %s seconds" % (get_time_diff_to_now(start_time)))
        sys.exit(0)