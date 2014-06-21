# -*- coding: utf-8 -*-
#
#	cdb_manipulate.rb
#
#						Mar/26/2013
#
require 'libcdb'
require 'json'
require 'fileutils'
#
# ------------------------------------------------------------
def cdb_read_proc (file_cdb)
	dict_aa = {}
	LibCDB::CDB.foreach(file_cdb) { |key, value|
		unit=JSON.parse(value)
		dict_aa[key]=unit
	}

	return	dict_aa
end
# ------------------------------------------------------------
def cdb_write_proc (file_cdb,dict_aa)
	FileUtils.rm_f(file_cdb)
	LibCDB::CDB.open(file_cdb, 'w') { |cdb|
		dict_aa.each {|key, value|
			json_str = JSON.generate(value)
  			cdb[key] = json_str
		}

	FileUtils.chmod(0666, file_cdb)
	}
end
# ------------------------------------------------------------
