        identification  division.
        program-id.     test1.
        data            division.
        working-storage section.
        01  cid         usage pointer.
        01  result      usage pointer.
        01  a           pic  9(06).
        01  b           pic  x(10).
        01  c           pic  9(05).
        01  errno       pic  x(04).
        01  err-msg     pic  x(80).
        01  eod         pic      x.
        procedure       division.

            call "MySQL_init"  using cid
            if return-code not = 0 then
               perform db-error
            end-if

            call "MySQL_real_connect" 
                        using "host_mysql" "scott"  "tiger"
            if return-code not = 0 then
               perform db-error
            end-if

            call "MySQL_selectdb"  using "city"
            if return-code not = 0 then
               perform db-error
            end-if

            call "MySQL_query" using "select * from cities"
            if return-code not = 0 then
               perform db-error
            end-if

            call "MySQL_use_result" using result
            if result = NULL then
               perform db-error
            end-if

            call "MySQL_fetch_fields" using result a b c
            if result = NULL then
               perform db-error
            end-if
            display  a b c

            perform until eod not = eod
               call "MySQL_fetch_row" using result a b c
               if return-code = -1 then
                  exit perform
               end-if
               display  a b c
            end-perform

            call "MySQL_close"

            stop run.

      * error
       db-error.
           call "MySQL_errno" using errno
           display errno ":"
           call "MySQL_error" using err-msg
           display err-msg
           stop run.
