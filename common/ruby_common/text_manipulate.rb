#! /usr/bin/ruby
#
#	ruby_common/text_manipualate.rb
#
#					Oct/02/2015
#
# -------------------------------------------------------------
require	"date"
#
# -------------------------------------------------------------
def text_read_proc (file_in)
	ff = File.open(file_in,"r:UTF-8")
	dict_aa = {}
	while(line = ff.gets)
		line=line.chomp
		cols = line.split()
		if 2 < cols.length then
			unit = {}
#			unit['id'] = cols[0].to_i
			unit['name'] = cols[1]
			unit['population'] = cols[2].to_i
			unit['date_mod'] = cols[3]
			key = cols[0]
			dict_aa[key]=unit
		end
	end
	ff.close
	return	dict_aa
end
#

# -------------------------------------------------------------
def dict_display_proc (dict_aa)
	dict_aa.sort.each {|key, value|
		if (key.to_s != '_id') && (key.to_s != '_rev')
			print(key,"\t",value['name'],"\t")
			print(value['population'],"\t")
			print(value['date_mod'],"\n")
		end
	}
end
# -------------------------------------------------------------
def text_write_proc (file_out,dict_aa)
	puts "*** text_write_proc *** start ***"
	fp_out = File.open(file_out,"w")
	dict_aa.each {|key, value|
		fp_out.print key,"\t"
		fp_out.print value['name'],"\t"
		fp_out.print value['population'],"\t"
		fp_out.print value['date_mod'],"\n"
	}
	fp_out.close
	puts "*** text_write_proc *** end ***"
end
# -------------------------------------------------------------
def dict_update_proc (dict_aa,key,population_in)
	puts "*** dict_update_proc *** start *** " + key
	unit=dict_aa[key]
	print	unit['name'] + "\t"
	print	unit['population']
	puts
	unit['population'] = population_in
	unit['date_mod'] = Date.today
	puts "*** update_proc *** end ***"
#
	return	dict_aa
end

# -------------------------------------------------------------
def dict_delete_proc (dict_aa,key)
	puts "*** dict_delete_proc *** start ***"
	if (dict_aa.key?(key))
		unit=dict_aa[key]
		print	unit['name'],"\t"
		print	unit['population'],"\n"
		dict_aa.delete(key)
	end
	puts "*** delete_proc *** end ***"
#
	return	dict_aa
end

# -------------------------------------------------------------
def dict_append_proc (dict_aa,id,name,population,date_mod)
	unit = {}
	unit['name'] = name
	unit['population'] = population
	unit['date_mod'] = date_mod
	key = id.to_s
	dict_aa[key] = unit
	return dict_aa
end
# -------------------------------------------------------------
def csv_read_proc (file_in)
	ff = File.open(file_in,"r:UTF-8")
	dict_aa = {}
	while(line = ff.gets)
		line=line.chomp
		cols = line.split(",")
		unit = {}
		unit['name'] = cols[1]
		unit['population'] = cols[2].to_i
		unit['date_mod'] = cols[3]
		key = cols[0]
		dict_aa[key]=unit
	end
	ff.close
	return	dict_aa
end
#
# -------------------------------------------------------------
def csv_write_proc (file_out,dict_aa)
	puts "*** csv_write_proc *** start ***"
	fp_out = File.open(file_out,"w")
	dict_aa.each {|key, value|
		fp_out.print key,","
		fp_out.print value['name'],","
		fp_out.print value['population'],","
		fp_out.print value['date_mod'],"\n"
	}
	fp_out.close
	puts "*** csv_write_proc *** end ***"
end
# -------------------------------------------------------------
