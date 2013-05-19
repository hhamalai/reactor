#!/usr/bin/env python
import zmq
from zmq.eventloop import ioloop
from zmq.eventloop.zmqstream import ZMQStream
ioloop.install()

import sys, os
libs_dir = os.path.join(os.path.dirname( os.path.realpath( __file__ ) ),  '..', 'pythonlibs')
if os.path.isdir(libs_dir):                                       
    sys.path.append(libs_dir)
import zmq_utilities


service_name="test_asyncrpc"

wrapper = zmq_utilities.zmq_bonjour_bind_wrapper(zmq.ROUTER, service_name)
stream = wrapper.stream

def server_recv_callback(frames):
    print "server_recv_callback got %s" % repr(frames)
    command = None
    if len(frames) == 1:
        client_id = frames[0]
    if len(frames) > 2:
        client_id = frames[0]
        command = frames[1]
        data = frames[2:]
    if command:
        if command == "gimme":
            bottles = int(data[0])
            print "Sending bottles as reply"
            stream.send_multipart((client_id, "Here's %d bottles of beer" % bottles))
        else:
            print "Echoing data back to client"
            stream.send_multipart([client_id, command ] + list(data))


stream.on_recv(server_recv_callback)


print "starting ioloop"
ioloop.IOLoop.instance().start()