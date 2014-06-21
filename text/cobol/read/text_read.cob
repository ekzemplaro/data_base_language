* ---------------------------------------------------------
*	text_read.cob
*
*					May/19/2011
*
* ---------------------------------------------------------
IDENTIFICATION DIVISION.
PROGRAM-ID.        text_read.
* ---------------------------------------------------------
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
SELECT I-FILE
    ASSIGN TO W-INPUT-FILENAME
    ORGANIZATION LINE SEQUENTIAL.
* ---------------------------------------------------------
DATA DIVISION.
FILE SECTION.
FD  I-FILE
    LABEL RECORDS ARE STANDARD.
01  INP-REC.
    03 PIC X(70).
* ---------------------------------------------------------
WORKING-STORAGE SECTION.
77  W-INPUT-FILENAME PIC X(256) VALUE "/var/tmp/plain_text/cities.txt".
77  W-EOF PIC X VALUE LOW-VALUE.
* ---------------------------------------------------------
PROCEDURE DIVISION.
DISPLAY "*** 開始 ***".
OPEN INPUT I-FILE.
READ I-FILE INTO INP-REC AT END MOVE HIGH-VALUE TO W-EOF.
PERFORM UNTIL W-EOF = HIGH-VALUE
DISPLAY INP-REC
   READ I-FILE INTO INP-REC
        AT END MOVE HIGH-VALUE TO W-EOF END-READ
END-PERFORM.
CLOSE I-FILE.
DISPLAY "*** 終了 ***".
STOP RUN.
* ---------------------------------------------------------
