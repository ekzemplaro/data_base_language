html:
	./go_html_gen.sh
	ln -s couchdb_total.html index.html
	cd html_src; make html;
clean:
	rm -f *.html
	cd html_src; make clean;
