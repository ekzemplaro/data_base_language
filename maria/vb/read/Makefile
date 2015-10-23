maria_read.exe : maria_read.vb
	vbnc -out:maria_read.exe maria_read.vb \
		/r:MySql.Data.dll
	chmod +x maria_read.exe
clean:
	rm -f *.exe
