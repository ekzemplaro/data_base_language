#! /usr/bin/python
#
#
#
from http import cookies
C = cookies.SimpleCookie()
C["aa"] = "富士山"
C["sugar"] = "wafer"
print(C)
print("")
print("")

print("<!DOCTYPE html>")
print("<html lang=\"ja\">")
print("<body>")
print("Aug/14/2020<p/>")
print("</body>")
print("</html>")
