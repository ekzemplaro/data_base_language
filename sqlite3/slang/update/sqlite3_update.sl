#! /usr/bin/slsh
%
%	sqlite3_update.sl
%
%						Aug/30/2013
%
% --------------------------------------------------------------------

import	("sqlite");

require ("cmdopt");

print ("*** 開始 ***");
print ("*** start ***");


variable file_in = __argv[1];
variable id_in = __argv[2];
variable population_in = __argv[3];
print (file_in);
print (id_in + "  " + population_in);
print (population_in);

variable db = sqlite_open (file_in);
if (db == NULL)
	throw OpenError, "Unable to open $file"$;

variable sql_str = "update cities set population = " + population_in + " where id = " + id_in;
sqlite_exec (db,sql_str);


print ("*** end ***");
print ("*** 終了 ***");
% --------------------------------------------------------------------
