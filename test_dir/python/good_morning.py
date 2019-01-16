#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#					Jan/06/2019
# ---------------------------------------------------------------
import socket
import os
import cgi

# ---------------------------------------------------------------
print("Content-Type: text/html")
print("")
print("Good Morning<p />")
print("Good Morning<p />")
print(socket.gethostname() + "<p />")
ip = socket.gethostbyname(socket.gethostname())
print(ip + "<p />")
print(cgi.escape(os.environ["REMOTE_ADDR"]) + "<p />")
print("Good Morning<p />")
# ---------------------------------------------------------------
