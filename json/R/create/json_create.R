# ---------------------------------------------------------
#	json_create.R
#
#				Feb/21/2014
#
# ---------------------------------------------------------
record_create_proc<-function (id,name,population,date_mod,tx){
#
	write (paste ("\"",id,"\": {",sep = ""),file=file_out, append=T)
	write (paste ("\"name\":\"",name,"\"," ,sep = ""),file=file_out, append=T)
	write (paste ("\"population\":",population,",",sep = ""),file=file_out, append=T)
	write (paste ("\"date_mod\":\"",date_mod,"\"}",tx,sep = ""),file=file_out, append=T)

}

# ---------------------------------------------------------
print ("*** 開始 ***")
file_out <- commandArgs(trailingOnly=TRUE)[2]
print (file_out)

write ("{",file=file_out)

record_create_proc ("t0921","宇都宮","49817","1946-8-14",",")
record_create_proc ("t0922","小山","75124","1946-9-27",",")
record_create_proc ("t0923","佐野","35891","1946-5-21",",")
record_create_proc ("t0924","足利","87365","1946-7-15",",")
record_create_proc ("t0925","日光","28564","1946-10-5",",")
record_create_proc ("t0926","下野","51297","1946-1-17",",")
record_create_proc ("t0927","さくら","36718","1946-3-18",",")
record_create_proc ("t0928","矢板","47386","1946-8-9",",")
record_create_proc ("t0929","真岡","39845","1946-2-22",",")
record_create_proc ("t0930","栃木","51827","1946-6-21",",")
record_create_proc ("t0931","大田原","45763","1946-4-8",",")
record_create_proc ("t0932","鹿沼","81462","1946-8-7",",")
record_create_proc ("t0933","那須塩原","63829","1946-7-12",",")
record_create_proc ("t0934","那須烏山","27651","1946-3-21","}")


print ("*** 終了 ***")
# ---------------------------------------------------------
