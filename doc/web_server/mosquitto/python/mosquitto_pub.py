#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mosquitto_pub.py
#
#						Mar/31/2017
# --------------------------------------------------------------------
import sys
import paho.mqtt.publish as publish
#
str_out = "こんにちは!\n"
str_out += "今日は雨になりそうです。\n"
str_out += "これは、モスキートのサンプルです。\n"
publish.single("message",str_out, hostname="localhost")
#
# --------------------------------------------------------------------
