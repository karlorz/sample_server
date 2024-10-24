# sample_server.py
from http.server import BaseHTTPRequestHandler, HTTPServer
import sdnotify

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/health':
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b'{"status": "healthy"}')
        else:
            self.send_response(404)
            self.end_headers()

def run(server_class=HTTPServer, handler_class=SimpleHTTPRequestHandler):
    server_address = ('', 8000)
    httpd = server_class(server_address, handler_class)
    print('Starting server...')
    notifier = sdnotify.SystemdNotifier()
    notifier.notify("READY=1")
    httpd.serve_forever()

if __name__ == '__main__':
    run()