#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#					Oct/26/2017
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
print(cgi.escape(os.environ["REMOTE_ADDR"]) + "<p />")
print("Good Morning<p />")
# ---------------------------------------------------------------
