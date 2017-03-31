#! /usr/bin/node
// ---------------------------------------------------------------
//	mosquitto_pub.js
//
//						Mar/31/2017
// ---------------------------------------------------------------
var mqtt = require('mqtt')

var client = mqtt.connect ('mqtt://localhost')

client.publish ('message', 'こんにちは。')

client.end()
// ---------------------------------------------------------------
