#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	receive02.py
#
#					Oct/27/2016
# --------------------------------------------------------------------
import sys
import socket

UDP_IP = "0.0.0.0"
UDP_PORT = 47808
sock = socket.socket (socket.AF_INET,socket.SOCK_DGRAM)
sock.bind ((UDP_IP,UDP_PORT))
while True:
	data, addr = sock.recvfrom (1024)
	try:
		print ("received message: " + data.decode('utf-8'))
	except Exception as ee:
		sys.stderr.write ("*** error ***\n")
		sys.stderr.write (str (ee))
		print (data)
# --------------------------------------------------------------------
