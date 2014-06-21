# -----------------------------------------------------------
#	exist_read.R
#
#				Oct/18/2010
#
# -----------------------------------------------------------
print ("*** 開始 ***")
rpage=url('http://localhost:8086/exist/rest/cities/cities.xml','r')
while (1){
	ll = readLines (rpage,1)
	if (length(ll) ==0) break
	print (ll)
}
close (rpage)
print ("*** 終了 ***")
# -----------------------------------------------------------
