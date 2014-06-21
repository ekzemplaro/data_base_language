#! /usr/bin/slsh
%
%	text_read.sl
%
%						Feb/16/2011
%
% --------------------------------------------------------------------

require ("cmdopt");

%Slutf8_enable (1);

print ("*** 開始 ***");
print ("*** start ***");

print (__argv[1]);

print ("");

variable file_in = __argv[1];

variable fp = fopen (file_in, "r");
   if (fp == NULL)
     throw OpenError, "Unable to open $file"$;

variable line, word;
while (-1 != fgets (&line, fp))
	{
		print (line);
%	foreach word (strtok (strlow(line), "^\\w"))
%		print (word);
	}
	() = fclose (fp);


print ("*** end ***");
print ("*** 終了 ***");
% --------------------------------------------------------------------
