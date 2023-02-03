import socket

s = socket.socket()
host = socket.gethostname()
port = 8000
s.bind((host, port))
s.listen(5)
while True:
    c, addr = s.accept()
    i = c.recv(10000)

    #print('Got connection from', addr)
    #c.send(b'Thank you for connecting')
    print(i.decode())
    c.close()