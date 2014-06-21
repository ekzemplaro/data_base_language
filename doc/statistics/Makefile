html:
	./go_html_gen.sh
	ln -s statistics.html index.html
	cd lang_sum; make html
	cd db_sum; make html
	cd db_edit; make html
clean:
	rm -f *.html
	cd lang_sum; make clean
	cd db_sum; make clean
	cd db_edit; make clean
