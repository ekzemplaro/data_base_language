#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	gdbm_create.rb
#
#						Aug/26/2013
# --------------------------------------------------------------------
require	'dbm'
#
# --------------------------------------------------------------------
puts '*** 開始 ***'
#
file_dbm=ARGV[0]
#
File::delete(file_dbm + ".dir")
File::delete(file_dbm + ".pag")
#
dd=DBM.new("/var/tmp/gdbm/cities")
#
#
dd["t2151"]='{"name": "岐阜","population": 81239,"date_mod": "2006-9-15"}';
dd["t2152"]='{"name": "大垣","population": 16872,"date_mod": "2006-2-22"}';
dd["t2153"]='{"name": "多治見","population": 72315,"date_mod": "2006-3-14"}';
dd["t2154"]='{"name": "各務原","population": 74632,"date_mod": "2006-8-2"}';
dd["t2155"]='{"name": "土岐","population": 21835,"date_mod": "2006-5-21"}';
dd["t2156"]='{"name": "高山","population": 32194,"date_mod": "2006-10-12"}';
dd["t2157"]='{"name": "美濃加茂","population": 82734,"date_mod": "2006-11-24"}';
dd["t2158"]='{"name": "恵那","population": 45176,"date_mod": "2006-10-16"}';
dd["t2159"]='{"name": "関","population": 62837,"date_mod": "2006-11-25"}';
dd["t2160"]='{"name": "中津川","population": 82534,"date_mod": "2006-12-4"}';
dd.close
#
File::chmod(0666,file_dbm + ".dir")
puts '*** 終了 ***';
#
# --------------------------------------------------------------------
