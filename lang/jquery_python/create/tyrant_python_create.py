#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	tyrant_python_create.py
#
#						Feb/10/2015
# -------------------------------------------------------------------------
import sys
import memcache
#
# -------------------------------------------------------------------------
#
mc = memcache.Client(['host_ubuntu1:1978'])
mc.flush_all()
#
mc.set('t4761', '{"name":"那覇","population":38500,"date_mod":"2003-5-21"}')
mc.set('t4762', '{"name":"宜野湾","population":26400,"date_mod":"2003-4-18"}')
mc.set('t4763', '{"name":"石垣","population":67900,"date_mod":"2003-7-2"}')
mc.set('t4764', '{"name":"浦添","population":16300,"date_mod":"2003-8-14"}')
mc.set('t4765', '{"name":"名護","population":32700,"date_mod":"2003-9-4"}')
mc.set('t4766', '{"name":"糸満","population":67200,"date_mod":"2003-10-7"}')
mc.set('t4767', '{"name":"沖縄","population":58600,"date_mod":"2003-11-4"}')
mc.set('t4768', '{"name":"豊見城","population":71300,"date_mod":"2003-8-17"}')
mc.set('t4769', '{"name":"うるま","population":25800,"date_mod":"2003-7-25"}')
#
#
print ("Content-type: text/html\n\n")
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
