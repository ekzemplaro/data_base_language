#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# ---------------------------------------------------------------
print("Content-Type: text/plain")
print("")
print("file write.")

file_out = "/tmp/tmp009.txt"
fp_out = open(file_out,mode='w', encoding='utf-8')
str_out = "test\n"
fp_out.write(str_out)
fp_out.close()
print("")
print("file writen.")

# ---------------------------------------------------------------
