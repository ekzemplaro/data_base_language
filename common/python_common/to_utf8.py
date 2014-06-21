#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	to_utf8.py
#					May/22/2012
import	sys
# ------------------------------------------------------------------
def guess_charset(data):
    f = lambda d, enc: d.decode(enc);
    codecs = ['shift_jis','utf-8','euc_jp','cp932',
              'euc_jis_2004','euc_jisx0213','iso2022_jp','iso2022_jp_1',
              'iso2022_jp_2','iso2022_jp_2004','iso2022_jp_3','iso2022_jp_ext',
              'shift_jis_2004','shift_jisx0213','utf_16','utf_16_be',
              'utf_16_le','utf_7','utf_8_sig'];

    for codec in codecs:
        try: return f(data, codec);
        except: continue;
    return None;
# ------------------------------------------------------------------
def guess_charset_old(data):
	ff = lambda d, enc: d.decode(enc) and enc

	try: return ff(data, 'utf-8')
	except: pass
	try: return ff(data, 'shift-jis')
	except: pass
	try: return ff(data, 'euc-jp')
	except: pass
	try: return ff(data, 'iso2022-jp')
	except: pass
	return None
# ------------------------------------------------------------------
def to_utf8_proc(data):
#	print "data = " + data
	charset = guess_charset(data)
#	print "charset = " + str (charset)
	if (charset != None):
		uu = data.decode(charset)
	else:
		uu = data
	return uu.encode('utf-8')
# ------------------------------------------------------------------
