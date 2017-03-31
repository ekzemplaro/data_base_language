#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mosuquitto_sub.py
#
#						Mar/31/2017
# --------------------------------------------------------------------
import sys
import paho.mqtt.client as mqtt
import os
#
# --------------------------------------------------------------------
def on_connect(mqttc, obj, rc):
    sys.stderr.write ("*** on_connect ***\n")
    print("rc: "+str(rc))

# --------------------------------------------------------------------
def on_message(mqttc, obj, msg):
    sys.stderr.write ("*** on_message *** start ***\n")
    print(msg.topic+" "+str(msg.qos)+" "+str(msg.payload))
    sys.stderr.write ("*** on_message *** ccc ***\n")
    print (msg.payload.decode('utf-8'))
    sys.stderr.write ("*** on_message *** end ***\n")

# --------------------------------------------------------------------
def on_publish(mqttc, obj, mid):
    sys.stderr.write ("*** on_publish ***\n")
    print("mid: "+str(mid))

# --------------------------------------------------------------------
def on_subscribe(mqttc, obj, mid, granted_qos):
    print("Subscribed: "+str(mid)+" "+str(granted_qos))

# --------------------------------------------------------------------
def on_log(mqttc, obj, level, string):
    sys.stderr.write ("*** on_log ***\n")
    print(string)

# --------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
mqttc = mqtt.Client()
mqttc.on_message = on_message
mqttc.on_connect = on_connect
mqttc.on_publish = on_publish
mqttc.on_subscribe = on_subscribe
# Uncomment to enable debug messages
mqttc.on_log = on_log
# mqttc.connect("HOST NAME", 1883, 60)
mqttc.connect("localhost", 1883, 60)
mqttc.subscribe("message", 0)

sys.stderr.write ("*** ccc ***\n")

mqttc.loop_forever()
#
sys.stderr.write ("*** 終了 ***\n")
# --------------------------------------------------------------------
