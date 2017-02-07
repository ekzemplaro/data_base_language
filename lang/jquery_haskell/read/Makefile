all : master_haskell_read.o json_haskell_read.o couch_haskell_read.o \
	text_haskell_read.o
master_haskell_read.o : master_haskell_read.hs
	ghc --make master_haskell_read.hs
json_haskell_read.o : json_haskell_read.hs
	ghc --make json_haskell_read.hs
couch_haskell_read.o : couch_haskell_read.hs
	ghc --make couch_haskell_read.hs
text_haskell_read.o : text_haskell_read.hs
	ghc --make text_haskell_read.hs
html:
	./go_html_gen.sh
	cd html_src;make html;
clean:
	rm -f master_haskell_read text_haskell_read \
		json_haskell_read couch_haskell_read \
		*.o *.hi
	cd html_src;make clean;
