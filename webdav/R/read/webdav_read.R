# -----------------------------------------------------------
#	webdav_read.R
#
#				Mar/30/2012
#
# -----------------------------------------------------------
print ("*** 開始 ***")
rpage=url('http://host_dbase:3004/city/tokyo.json','r')
while (1){
	ll = readLines (rpage,1)
	if (length(ll) ==0) break
	print (ll)
}
close (rpage)
print ("*** 終了 ***")
# -----------------------------------------------------------
