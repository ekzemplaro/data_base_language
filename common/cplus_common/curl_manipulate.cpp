// --------------------------------------------------------------------
/*
	curl_manipulate.cpp

					Feb/10/2015
*/
// --------------------------------------------------------------------
#include	<cstdio>
#include	<string>
#include	<cstring>
#include	<iostream>
#include	<fstream>
#include	<boost/lexical_cast.hpp>

#include	<fcntl.h>
#include	<curl/curl.h>

#include	<stdio.h>
#include	<stdlib.h>
#include	<sys/stat.h>
#include	<unistd.h>

using namespace std;

// --------------------------------------------------------------------
size_t callBackFunk(char* ptr, size_t size, size_t nmemb, string* stream)
{
	int realsize = size * nmemb;
	stream->append(ptr, realsize);
	return realsize;
}

// --------------------------------------------------------------------
string url_get_proc (const char url[])
{
// cout << "url = " << url << endl;

	CURL *curl;
	CURLcode res;
	curl = curl_easy_init();
	string chunk;

	if (curl)
		{
		curl_easy_setopt(curl, CURLOPT_URL, url);
		curl_easy_setopt (curl, CURLOPT_WRITEFUNCTION, callBackFunk);
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, (string*)&chunk);
		curl_easy_setopt(curl, CURLOPT_PROXY, "");
		res = curl_easy_perform(curl);
		curl_easy_cleanup(curl);
		}
	if (res != CURLE_OK) {
		cout << "curl error" << endl;
		exit (1);
	}

	return chunk;
}

// --------------------------------------------------------------------
// [8-4-6]:
static int read_callback(void *ptr, size_t size, size_t nmemb, FILE *stream)
{
	int retcode;

	retcode = fread  (ptr,size,nmemb,stream);

	cout << "retcode = " << retcode << endl;

	return retcode;
}

// --------------------------------------------------------------------
// [8-4]:
void curl_file_put_proc (char *file,const char *url)
{
	CURL *curl;
	CURLcode res;
	FILE * hd_src ;
	int hd ;
	struct stat file_info;

  /* get the file size of the local file */
  hd = open(file, O_RDONLY) ;
  fstat(hd, &file_info);
  close(hd) ;

  /* get a FILE * of the same file, could also be made with
     fdopen() from the previous descriptor, but hey this is just
     an example! */
  hd_src = fopen(file, "rb");

  /* In windows, this will init the winsock stuff */
  curl_global_init(CURL_GLOBAL_ALL);

  /* get a curl handle */
  curl = curl_easy_init();
  if(curl) {
    /* we want to use our own read function */
    curl_easy_setopt(curl, CURLOPT_READFUNCTION, read_callback);

    /* enable uploading */
    curl_easy_setopt(curl, CURLOPT_UPLOAD, 1L);

    /* HTTP PUT please */
    curl_easy_setopt(curl, CURLOPT_PUT, 1L);

    /* specify target URL, and note that this URL should include a file
       name, not only a directory */
    curl_easy_setopt(curl, CURLOPT_URL, url);

    /* now specify which file to upload */
    curl_easy_setopt(curl, CURLOPT_READDATA, hd_src);

    /* provide the size of the upload, we specicially typecast the value
       to curl_off_t since we must be sure to use the correct data size */

    curl_easy_setopt(curl, CURLOPT_INFILESIZE_LARGE,
                     (curl_off_t)file_info.st_size);

		curl_easy_setopt(curl, CURLOPT_PROXY, "");

    /* Now run off and do what you've been told! */
    res = curl_easy_perform(curl);

    /* always cleanup */
    curl_easy_cleanup(curl);
  }
  fclose(hd_src); /* close the local file */

	curl_global_cleanup();
}

// --------------------------------------------------------------------
// [8]:
void curl_put_proc (const char url_target[],string str_in)
{
	CURL *curl;
	CURLcode res;

	curl = curl_easy_init();

	if (curl)
		{
		curl_slist *headers = NULL;

		headers = curl_slist_append
			(headers, "Content-Type: application/json");

// cerr << "*** curl_put_proc *** ddd\n";

	curl_easy_setopt (curl,CURLOPT_HTTPHEADER,headers); 
	curl_easy_setopt (curl,CURLOPT_URL,url_target);  
	curl_easy_setopt (curl,CURLOPT_CUSTOMREQUEST,"PUT");
	curl_easy_setopt (curl,CURLOPT_PROXY,"");

// cerr << "*** curl_put_proc *** ggg\n";

	if (0 < str_in.length () )
		{
	curl_easy_setopt(curl, CURLOPT_POSTFIELDS, str_in.c_str ());
		}

// cerr << "*** curl_put_proc *** hhh\n";
	res = curl_easy_perform (curl);
// cerr << "*** curl_put_proc *** iii\n";

	curl_slist_free_all(headers);
	}

	curl_easy_cleanup(curl);
}

// --------------------------------------------------------------------
void curl_delete_proc (const char url[])
{
	CURL *curl;
	CURLcode res;
	curl = curl_easy_init ();
	string chunk;

	if (curl)
		{
		curl_easy_setopt (curl,CURLOPT_URL,url);
		curl_easy_setopt (curl,CURLOPT_CUSTOMREQUEST,"DELETE");
		curl_easy_setopt (curl,CURLOPT_PROXY,"");
		res = curl_easy_perform (curl);
		curl_easy_cleanup (curl);
		}

	if (res != CURLE_OK)
		{
		cout << "DELETE curl error" << endl;
		exit (1);
		}
}

// --------------------------------------------------------------------
