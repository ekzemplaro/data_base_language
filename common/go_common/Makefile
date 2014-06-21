all: text_manipulate
text_manipulate: text_manipulate.go
	go build text_manipulate.go
html:
	cd html_src;make html
clean:
	rm -f *.8
	cd html_src;make clean
