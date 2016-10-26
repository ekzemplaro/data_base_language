#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	receive01.py
#
#					Oct/26/2016
# --------------------------------------------------------------------
import socket
from contextlib import closing

# --------------------------------------------------------------------
host = '0.0.0.0'
port = 47808
bufsize = 4096

sock = socket.socket (socket.AF_INET, socket.SOCK_DGRAM)
count = 0
with closing (sock):
	sock.bind ((host,port))
	while True:
		print (str (count) + "," + str(sock.recv(bufsize)))
		count += 1
#
# --------------------------------------------------------------------
