export HBASE_INSTALL=/home/uchida/dbm/hbase/hbase-0.96.0-hadoop2
export PATH=$PATH:$HBASE_INSTALL/bin
#
hbase shell << EOF
disable 'cities'
drop 'cities'
create 'cities','name','population','date_mod'
put 'cities','t1671','name','富山'
put 'cities','t1671','population','53428'
put 'cities','t1671','date_mod','2001-3-15'

put 'cities','t1672','name','高岡'
put 'cities','t1672','population','45672'
put 'cities','t1672','date_mod','2001-8-21'

put 'cities','t1673','name','魚津'
put 'cities','t1673','population','36928'
put 'cities','t1673','date_mod','2001-9-7'

put 'cities','t1674','name','氷見'
put 'cities','t1674','population','63541'
put 'cities','t1674','date_mod','2001-3-15'

put 'cities','t1675','name','滑川'
put 'cities','t1675','population','14392'
put 'cities','t1675','date_mod','2001-7-8'

put 'cities','t1676','name','黒部'
put 'cities','t1676','population','82159'
put 'cities','t1676','date_mod','2001-10-12'

put 'cities','t1677','name','砺波'
put 'cities','t1677','population','46925'
put 'cities','t1677','date_mod','2001-11-9'

put 'cities','t1678','name','小矢部'
put 'cities','t1678','population','87624'
put 'cities','t1678','date_mod','2001-9-7'

put 'cities','t1679','name','南砺'
put 'cities','t1679','population','21638'
put 'cities','t1679','date_mod','2001-7-24'

quit

EOF
