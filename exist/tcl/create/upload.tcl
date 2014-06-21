package require TclCurl


curl::transfer -url http://localhost:8086/exist/rest/cities/cities.xml
        -infilesize [file size in01.xml] -infile in01.xml -upload 1 \
        -verbose 1


