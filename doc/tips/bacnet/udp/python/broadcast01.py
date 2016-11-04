#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	broadcast01.py
#
#					Oct/27/2016
#
# --------------------------------------------------------------------
from socket import *
import sys

# --------------------------------------------------------------------
HOST = ''
PORT = 47808
ADDRESS = "192.168.0.255"

ss =socket (AF_INET,SOCK_DGRAM)
ss.setsockopt (SOL_SOCKET,SO_BROADCAST,1)
ss.bind ((HOST,PORT))

for it in range (5):
	msg = "Hello " + str (it)
	ss.sendto (msg.encode('utf-8'),(ADDRESS,PORT))
ss.close()
sys.exit()
# --------------------------------------------------------------------
