all: text_manipulate.js xml_manipulate.js
xml_manipulate.js: xml_manipulate.ts
	tsc --module commonjs xml_manipulate.ts
text_manipulate.js: text_manipulate.ts
	tsc --module commonjs text_manipulate.ts
clean:
	rm  -f *.js
