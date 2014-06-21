#! /usr/bin/slsh
%
%	sqlite3_read.sl
%
%						Aug/30/2013
%
% --------------------------------------------------------------------

import	("sqlite");

require ("cmdopt");

%SLutf8_enable (1);

print ("*** 開始 ***");
print ("*** start ***");

print (__argv[1]);

print ("");

variable file_in = __argv[1];

variable db = sqlite_open (file_in);
if (db == NULL)
	throw OpenError, "Unable to open $file"$;

variable tbls = sqlite_get_table (db,"select * from cities");

print (tbls);

print ("*** end ***");
print ("*** 終了 ***");
% --------------------------------------------------------------------
