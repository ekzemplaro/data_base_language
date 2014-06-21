// ------------------------------------------------------------
//	json_create.boo
//
//					Sep/26/2011
//
// ------------------------------------------------------------
import System
import System.IO

// ------------------------------------------------------------
def out_proc (id,name,population,date_mod):
	str_out = "\"${id}\": {"
	str_out += "\"name\": \"${name}\","
	str_out += "\"population\": ${population},"
	str_out += "\"date_mod\": \"${date_mod}\"},"
	return str_out
// ------------------------------------------------------------
print '*** 開始 ***'
file_out = argv[0]

fp_out = StreamWriter (file_out)

str_out = "{\n"
str_out += out_proc ('t0921','宇都宮','24936','1968-8-15')
str_out += out_proc ('t0922','小山','52617','1968-10-27')
str_out += out_proc ('t0923','佐野','34593','1968-5-16')
str_out += out_proc ('t0924','足利','52498','1968-9-23')
str_out += out_proc ('t0925','日光','41859','1968-3-9')
str_out += out_proc ('t0926','下野','82653','1968-5-19')
str_out += out_proc ('t0927','日光宮','51748','1968-9-12')
str_out += out_proc ('t0928','矢板','94372','1968-8-18')
str_out += out_proc ('t0929','真岡','57864','1968-7-11')
str_out += out_proc ('t0930','栃木','64235','1968-9-24')
str_out += out_proc ('t0931','大田原','23587','1968-5-15')
str_out += out_proc ('t0932','鹿沼','63981','1968-8-17')
str_out += out_proc ('t0933','那須塩原','84752','1968-9-19')
str_out += out_proc ('t0934','那須烏山','31258','1968-10-21')

llx = str_out.Length
print llx
str_out = str_out[0:llx -1] + "}\n"
fp_out.Write (str_out)
fp_out.Close ()

print '*** 終了 ***'
// ------------------------------------------------------------
