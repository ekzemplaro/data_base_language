#! /usr/bin/python
#
#	cookie_put.py
#
from http import cookies

C = cookies.SimpleCookie()
C["message"] = "This is a Test."
C["aa"] = "富士山"
C["bb"] = "谷川岳"
C["cc"] = "阿蘇山"

print(C.output())
print("")
print("")


print("Content-Type: text/html")
print("")
print("<!DOCTYPE html>")
print("<html lang=\"ja\">")
print("<body>")
print("Aug/14/2020<p/>")
print("</body>")
print("</html>")
