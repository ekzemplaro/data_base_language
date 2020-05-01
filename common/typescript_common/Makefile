all: text_manipulate.js xml_manipulate.js
xml_manipulate.js: xml_manipulate.ts
	tsc xml_manipulate.ts
text_manipulate.js: text_manipulate.ts
	tsc text_manipulate.ts
clean:
	rm  -f *.js
