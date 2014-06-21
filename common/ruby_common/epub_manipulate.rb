#! /usr/bin/ruby
#
#	epub_manipulate.rb
#
#					Jul/10/2012
#
# ---------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def epub_to_dict_proc (file_epub)
	command = "| java -jar /var/www/data_base/common/jar/tika-app-1.0.jar -t " + file_epub
	ff = open(command)
	dict_aa = {}
	while(line = ff.gets)
		line=line.chomp
		cols = line.split()
		if 2 < cols.length then
			if (cols[0][0..0] == "t") then
				unit = {}
				unit['name'] = cols[1]
				unit['population'] = cols[2].to_i
				unit['date_mod'] = cols[3]
				key = cols[0]
				dict_aa[key]=unit
			end
		end
	end
	ff.close
#
	return	dict_aa
end
# ---------------------------------------------------------------------
def dict_to_epub_proc (file_epub,dict_aa)
	file_tmp = "/tmp/tmp0052389.txt"

	text_write_proc(file_tmp,dict_aa)

	
	cmdline = "| ebook-convert " +  file_tmp + " " +file_epub
	ff = open(cmdline)
	ff.close
	FileUtils.rm(file_tmp)
end
# ---------------------------------------------------------------------
