#!/usr/bin/env python

from sys import argv
from io import StringIO
import hashlib


class githash(object):
    def __init__(self):
        self.buf = StringIO()

    def update(self, data):
        self.buf.write(data)

    def hexdigest(self):
        data = self.buf.getvalue()
        h = sha1()
        h.update("blob %u\0" % len(data))
        h.update(data)

        return h.hexdigest()


def githash_data(data):
    h = githash()
    h.update(data)
    return h.hexdigest()


def githash_fileobj(fileobj):
    return githash_data(fileobj.read())


if __name__ == '__main__':
    sha1 = hashlib.sha1()
    with open('/Users/junweizhang/gocode/src/code.uber.internal/odp/goautobots/idl/code.uber.internal/money/uberpay/uberpay_ux.thrift', 'r') as myfile:
        data = myfile.read()
    sha1.update(("blob %u\0" % len(data)).encode('utf-8'))
    print(("blob %u\0" % len(data)).encode('utf-8'))
    sha1.update(data.encode('utf-8'))
    sha2 = hashlib.sha1()
    sha2.update(data.encode('utf-8'))
    print(sha1.hexdigest())
    print(sha2.hexdigest())
