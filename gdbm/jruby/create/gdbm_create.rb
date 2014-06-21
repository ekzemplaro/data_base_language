#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	gdbm_create.rb
#
require	'dbm'
#
puts '*** 開始 ***';
#
#dd=DBM.new("/var/tmp/gdbm/cities.dbm")
dd=DBM.new("/var/tmp/gdbm/cities")
#dd=DBM.new("cities")
#
dd["2151"]='{"name": "岐阜","population": 81239,"date_mod": "2006-3-15"}';
dd["2152"]='{"name": "大垣","population": 12377,"date_mod": "2006-5-22"}';
dd["2153"]='{"name": "多治見","population": 523155,"date_mod": "2006-9-14"}';
dd["2154"]='{"name": "各務原","population": 74632,"date_mod": "2006-8-02"}';
dd["2155"]='{"name": "土岐","population": 21235,"date_mod": "2006-5-21"}';
dd["2156"]='{"name": "高山","population": 32131,"date_mod": "2006-10-12"}';
dd["2157"]='{"name": "美濃加茂","population": 82734,"date_mod": "2006-11-21"}';
dd["2158"]='{"name": "恵那","population": 4233,"date_mod": "2006-10-11"}';
dd["2159"]='{"name": "関","population": 62637,"date_mod": "2006-11-25"}';
dd["2160"]='{"name": "中津川","population": 82534,"date_mod": "2006-12-4"}';
dd.close
#
puts '*** 終了 ***';
#
