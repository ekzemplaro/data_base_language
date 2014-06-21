#! /usr/bin/slsh
%
%	couch_read.sl
%
%					Mar/30/2012
% --------------------------------------------------------------------
import ("curl");
% --------------------------------------------------------------------
define write_callback (fp, str)
{
	return fputs (str, fp);
}
% --------------------------------------------------------------------
define progress_callback (fp, dltotal, dlnow, ultotal, ulnow)
{
	if (-1 == fprintf (fp, "Bytes Received: %d\n", int(dlnow)))
		return -1;
	if (dltotal > 0.0)
		{
		if (-1 == fprintf (fp,"Percent Received: %g\n",
			dlnow/dltotal * 100.0))
		return -1;
		}

       return 0;
}
% --------------------------------------------------------------------
define header_callback (strp, str)
{
	@strp += str;
	return 0;
}
% --------------------------------------------------------------------
define download_url (url, file)
{
	variable fp = fopen (file, "w");
	variable c = curl_new (url);
	curl_setopt (c, CURLOPT_FOLLOWLOCATION);
	curl_setopt (c, CURLOPT_WRITEFUNCTION, &write_callback, fp);
	curl_setopt (c, CURLOPT_PROGRESSFUNCTION, &progress_callback, stdout);
	variable var = "";
	curl_setopt (c, CURLOPT_HEADERFUNCTION, &header_callback, &var);
	curl_perform (c);
	() = fprintf (stdout, "Header: %s\n", var);
}

% --------------------------------------------------------------------
%print ("*** 開始 ***");
print ("*** start ***");

download_url ("http://172.20.129.189:3004/city/tokyo.json", "./tmp01.txt");

print ("*** end ***");
% --------------------------------------------------------------------
