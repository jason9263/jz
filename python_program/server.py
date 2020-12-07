import asynchat
import asyncore

PORT = 6666


class EndSession(Exception):
    pass


class ChatServer(asyncore.dispatcher):
    def __init__(self, port):
        asyncore.dispatcher.__init__(self)
        self.create_socket()
        self.set_reuse_addr()
        self.bind(('', port))
        self.listen(5)
        self.user = {}
        self.main_room = Chatroom(self)

    def handle_accept(self):
        conn,addr = self.accept()
        ChatSession(self,conn)


class ChatSession(asynchat.async_chat):
    def __init__(self,server,sock):
        asynchat.async_chat.__init__(self,sock)
        self.server = server
        self.set_terminator(b"\n")
        self.data = []
        self.name = None
        self.enter(LoginRoom(server))

    def enter(self,room):
        try:
            cur = self.room
        except AttributeError:
            pass
        else:
            cur.remove(self)

    def collect_incoming_data(self, data):
        self.data.append(data.decode("utf-8"))

    def found_terminator(self):
        line = ''.join(self.data)
        self.data = []
        try:
            self.room.handle(self, line.encode("utf-8"))
        except EndSession:
            self.handle_close()

    def handle_close(self):
        asynchat.async_chat.handle_close(self)
        self.enter(LogOutRoom(self.server))
