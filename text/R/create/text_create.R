# ---------------------------------------------------------
#	text_create.R
#
#				Feb/21/2014
#
# ---------------------------------------------------------
aa=paste("t2381","名古屋","47825","1946-8-24",sep="\t")
bb=paste("t2382","豊橋","28157","1946-11-25",sep="\t")
cc=paste("t2383","岡崎","74192","1946-9-2",sep="\t")
dd=paste("t2384","一宮","38754","1946-6-25",sep="\t")
ee=paste("t2385","蒲郡","46352","1946-10-14",sep="\t")
ff=paste("t2386","常滑","65218","1946-9-12",sep="\t")
gg=paste("t2387","大府","37241","1946-3-21",sep="\t")
hh=paste("t2388","瀬戸","53496","1946-7-26",sep="\t")
ii=paste("t2389","犬山","26157","1946-12-2",sep="\t")


print ("*** 開始 ***")
file_out <- commandArgs(trailingOnly=TRUE)[2]
print (file_out)

write (aa,file=file_out)
write (bb,file=file_out, append=T)
write (cc,file=file_out, append=T)
write (dd,file=file_out, append=T)
write (ee,file=file_out, append=T)
write (ff,file=file_out, append=T)
write (gg,file=file_out, append=T)
write (hh,file=file_out, append=T)
write (ii,file=file_out, append=T)

print ("*** 終了 ***")
# ---------------------------------------------------------
