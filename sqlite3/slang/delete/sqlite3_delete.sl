#! /usr/bin/slsh
%
%	sqlite3_delete.sl
%
%						Apr/11/2011
%
% --------------------------------------------------------------------

import	("sqlite");

require ("cmdopt");

% SLutf8_enable (1);

print ("*** 開始 ***");
print ("*** start ***");


variable file_in = __argv[1];
variable id_in = __argv[2];
print (file_in);
print (id_in);

variable db = sqlite_open (file_in);
if (db == NULL)
	throw OpenError, "Unable to open $file"$;

variable sql_str = "delete from cities where id = \"" + id_in + "\"";
sqlite_exec (db,sql_str);


print ("*** end ***");
print ("*** 終了 ***");
% --------------------------------------------------------------------
