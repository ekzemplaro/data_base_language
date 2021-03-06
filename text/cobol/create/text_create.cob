* ---------------------------------------------------------
*	text_create.cob
*
*					Sep/24/2011
*
* ---------------------------------------------------------
IDENTIFICATION DIVISION.
PROGRAM-ID.        test-cob01.
* ---------------------------------------------------------
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
SELECT O-FILE
    ASSIGN TO W-OUTPUT-FILENAME
    ORGANIZATION LINE SEQUENTIAL.
* ---------------------------------------------------------
DATA DIVISION.
FILE SECTION.
FD  O-FILE
    LABEL RECORDS ARE STANDARD.
01  OUT-REC.
    03  PIC X(1024).
01  WORK_AREA PIC X(80).
WORKING-STORAGE SECTION.
77  W-OUTPUT-FILENAME PIC X(256) VALUE "/var/tmp/plain_text/cities.txt".
* ---------------------------------------------------------
PROCEDURE DIVISION.
DISPLAY "*** 開始 ***".
OPEN OUTPUT O-FILE.
*
STRING "t2381" X'09' "名古屋" X'09' "18254" X'09' "1941-3-21" DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
*
STRING "t2382" X'09' "豊橋" X'09' "54932" X'09' "1941-5-12" "      " DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
*
STRING "t2383" X'09' "岡崎" X'09' "37821" X'09' "1941-8-19" "      " DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
STRING "t2384" X'09' "一宮" X'09' "29854" X'09' "1941-9-8" "      " DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
STRING "t2385" X'09' "蒲郡" X'09' "73452" X'09' "1941-10-17" "      " DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
*
STRING "t2386" X'09' "常滑" X'09' "52846" X'09' "1941-3-4" "      " DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
*
STRING "t2387" X'09' "大府" X'09' "92356" X'09' "1941-8-21" "      " DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
*
STRING "t2388" X'09' "瀬戸" X'09' "58972" X'09' "1941-5-18" "      " DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
*
STRING "t2389" X'09' "犬山" X'09' "38943" X'09' "1941-10-19" "      " DELIMITED BY SIZE INTO WORK_AREA.
WRITE OUT-REC FROM WORK_AREA.
*
CLOSE O-FILE.
DISPLAY "*** 終了 ***".
STOP RUN.
* ---------------------------------------------------------
