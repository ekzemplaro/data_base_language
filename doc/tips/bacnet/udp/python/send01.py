#! /usr/bin/python
#  -*- coding: utf-8 -*-
#
#	send01.py
#
#					Oct/26/2017
#
# --------------------------------------------------------------------
import socket
#
UDP_IP = "192.168.0.12"
#
UDP_PORT =  47808
MESSAGE = "Good Morning!"
print ("UDP target IP:" + UDP_IP)
print ("UDP target port:" + str(UDP_PORT))
print ("message: " + MESSAGE)
sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM) # UDP
sock.sendto(MESSAGE.encode('utf-8'), (UDP_IP, UDP_PORT))
# --------------------------------------------------------------------
