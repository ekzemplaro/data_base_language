# ---------------------------------------------------------
#	xml_create.R
#
#				Feb/21/2014
#
# ---------------------------------------------------------
record_create_proc<-function (id,name,population,date_mod){
#
	write (paste ("<",id,">", sep = ""),file=file_out, append=T)
	write (paste ("<name>",name,"</name>"),file=file_out, append=T)
	write (paste ("<population>",population,"</population>"),file=file_out, append=T)
	write (paste ("<date_mod>",date_mod,"</date_mod>"),file=file_out, append=T)
	write (paste ("</",id,">", sep = ""),file=file_out, append=T)

#

}

# ---------------------------------------------------------
print ("*** 開始 ***")
file_out <- commandArgs(trailingOnly=TRUE)[2]
print (file_out)

write ("<?xml version=\"1.0\" encoding=\"utf-8\"?>",file=file_out)
write ("<root>",file=file_out, append=T)

record_create_proc ("t2261","静岡","49817","1946-8-24")
record_create_proc ("t2262","浜松","75364","1946-9-17")
record_create_proc ("t2263","沼津","35873","1946-10-21")
record_create_proc ("t2264","三島","87185","1946-7-15")
record_create_proc ("t2265","富士","28634","1946-2-5")
record_create_proc ("t2266","熱海","59172","1946-1-17")
record_create_proc ("t2267","富士宮","64318","1946-3-18")
record_create_proc ("t2268","藤枝","49326","1946-8-9")
record_create_proc ("t2269","御殿場","39245","1946-2-22")
record_create_proc ("t2270","島田","51827","1946-6-29")

write ("</root>",file=file_out, append=T)

print ("*** 終了 ***")
# ---------------------------------------------------------
