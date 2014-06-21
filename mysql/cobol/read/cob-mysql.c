/*  cob-mysql  Version  3.0                            25/Jul/2008   */
/*  Copyright (C) sanpontze. All Rights Reserved                     */

#include	<stdio.h>
#include        <string.h>
#include        <stdarg.h>
#include	<mysql.h>
#include        <libcob.h>

#define min(a,b) ((a) < (b) ? (a) : (b))

static int (*func)(char *errno, const char *errmsg); 

MYSQL            sql, *mysql=&sql;
static int       errout;

/* ----  アクセスプログラム共通関数  --------  */

/* 出口処理 */
void err_exit(int rc)
{
/*   正常終了 rc = 0  ではそのまま復帰する                                       */
/*   異常終了 rc != 0 では初期設定(MySQL_init)で設定されたエラー出口にしたがって */
/*   処理を分ける:                                                               */
/*     errout = 1:  エラーメッセージを stderr に出力して終了する                 */
/*     errout = 2:  エラーは呼び出し元で処理されるものとしてそのまま復帰する　　 */
/*     errout = 3:  エラーはユーザ作成のプログラムで処理されるものとして、       */
/*　　　　　　　　　errno, errmsgをパラメタとして指定されたプログラムを呼ぶ。    */

    char errno[10];

    if( !rc ) return;

    switch(errout){
        case 1: 
             fprintf(stderr,"%d¥n", mysql_errno(mysql));
             fprintf(stderr,"%s¥n", mysql_error(mysql));
             exit(1);
        case 2:
             break;
        case 3:
             sprintf(errno,"%d", mysql_errno(mysql));
             func(errno, mysql_error(mysql));
    }
    return;
}

/* 文字列をcobolに転写する関数 */
void move_to_cob(char *cob_dat, const char *dat)
{
    int len = strlen(cob_dat);                      // data length in cob
    memset(cob_dat, ' ', len);                      // clear with spaces
    memcpy(cob_dat, dat, min(len, strlen(dat)));    // data copy
    return;
}

/* ----  MySQL アクセス関数  (alphabet順）--------  */

void MySQL_affected_rows(int *no)
{ 
    *no =  mysql_affected_rows(mysql);
    return;
}

/* ユーザ切り替え */
int MySQL_change_user(const char *user, const char *passwd, const char *db)
{
    int rc;
    rc = mysql_change_user(mysql, user, passwd, db);
    err_exit(rc);
    return  rc;
}

/* データベース切断 */
void MySQL_close(void)
{
    mysql_close(mysql);
    return;
}

/* エラー番号 */
void MySQL_errno(char *errno)
{
    char buf[10];
    sprintf(buf,"%d", mysql_errno(mysql));
    move_to_cob(errno, buf);
    return;
}

/* エラーメッセージ*/
void MySQL_error(char *errmsg)
{
    move_to_cob(errmsg, mysql_error(mysql));
    return;
}

/* 指定された位置のフィールド名を取得 */
void MySQL_fetch_field(MYSQL_RES **result, int *pos, char *field)
{

    MYSQL_FIELD *fields;

    fields = mysql_fetch_fields(*result);
    move_to_cob(field, fields[ *pos - 1 ].name);
    return;
}

/* フィールド名を一括取得 */
void MySQL_fetch_fields(MYSQL_RES **result, ...)
{
    int rc, j, colms;
    va_list args;
    MYSQL_FIELD *fields;

    va_start(args, result);
    colms = min(cob_call_params, mysql_num_fields(*result));
    fields = mysql_fetch_fields(*result);

    for(j=0; j<colms; j++){
       move_to_cob(va_arg(args, char *), fields[j].name);
    }
    va_end(args);
    return;
}

/* 検索結果の行を取得 */
int MySQL_fetch_row(MYSQL_RES **result, ...)
{
    MYSQL_ROW res;
    va_list args;
    int rc, j, maxcols;

    res = mysql_fetch_row(*result);
    if(res != NULL){
      maxcols = min(cob_call_params, mysql_num_fields(*result));
       va_start(args, result);
       for(j=0; j<maxcols; j++){
          move_to_cob(va_arg(args, char *), res[j]);
       }
       va_end(args);
       rc = 0;
    } else {
       mysql_free_result(*result);
       rc = -1;
    }
    return rc;
}

/* フィールド個数取得 */
void MySQL_field_count(int *count)
{
    *count = mysql_field_count(mysql);
    return;
}

/* 領域開放 */
void MySQL_free_result(MYSQL_RES **result)
{
    mysql_free_result(*result);
    return;
}

void MySQL_get_character_set_info(char *csname)
{
    MY_CHARSET_INFO cs;
    mysql_get_character_set_info(mysql, &cs);
    move_to_cob(csname, cs.name);
    return;
}

/*  MySQL　初期設定 */
int MySQL_init(MYSQL **cid, ...)
{
/*  MySQL_init の using で指定されたエラーの出力先を設定する　　　　*/
/*    "stderr"            :  errout = 1                             */
/*    "省略"              :  errout = 2  呼び出し元に復帰           */
/*    "filename"          :  errout = 3  ユーザ作成のプログラム名   */

    int rc,n;
    char *fname;
    va_list args;

    *cid = mysql;

    rc = mysql_init(&sql) != NULL ? 0 : 1;
    va_start(args, cid);

    if(cob_call_params > 1){
       fname = va_arg(args, char *);
    }
    else {
       fname = "";
    }
    va_end(args);

    if( !strcmp(fname, "stderr") ){
        errout = 1;                               // stderr
    }
    else if( !strcmp(fname,"" ) ){
             errout = 2;                          // default
    }
    else {
       cob_init(0, NULL);
       func = cob_resolve(fname);
       if(func == NULL){
          fprintf(stderr, "%s¥n", cob_resolve_error());
          exit(1);
       }
       errout = 3;                                 // user function
    }

    err_exit(rc);
    return  rc;
}

/* テーブル名取得 */
int MySQL_list_tables( MYSQL_RES **res)
{
    int rc;
    *res = mysql_list_tables(mysql, NULL);
    rc = *res != NULL ? 0 : 1;
    err_exit(rc);
    return  rc;
}

/* 結果セットの列数*/
void MySQL_num_fields(MYSQL_RES **result, int *cols)
{
    *cols = mysql_num_fields(*result);
    return;
}

/* 結果セットの行数*/
void MySQL_num_rows(MYSQL_RES **result, int *rows)
{
    *rows = mysql_num_rows(*result);
    return;
}

/* クエリーの実行 */
int MySQL_query(char *query)
{
    int rc;
    rc =  mysql_query(mysql, query);
    err_exit(rc);
    return  rc;
}

/* MySQLサーバに接続 */
int MySQL_real_connect(char *host, char *user, char *passwd)
{
    int      rc;
    MYSQL    *tmp;

    tmp  =  mysql_real_connect(&sql, host, user, passwd, "", 0, NULL, 0);
    rc = tmp != NULL ? 0 : 1;
    err_exit(rc);
    return  rc;
}

/* データベースの選択 */
int MySQL_selectdb(char *dbname)
{
    int rc;
    rc = mysql_select_db(mysql, dbname);
    err_exit(rc);
    return  rc;
}

/* デフォルト文字セットをセット */
int MySQL_set_character_set(char *charset)
{
    int rc;
    rc = mysql_set_character_set(mysql, charset);
    err_exit(rc);
    return  rc;
} 

/* 結果セット作成 (ユーザ領域) */
int MySQL_store_result(MYSQL_RES **result)
{
    int rc;
    *result = mysql_store_result(mysql);
    rc = result != NULL ? 0 : 1;
    err_exit(rc);
    return  rc;
} 

/* 結果セット作成 (サーバ領域) */
int MySQL_use_result(MYSQL_RES **result)
{
    int rc;
    *result = mysql_use_result(mysql);
    rc = result != NULL ? 0 : 1;
    err_exit(rc);
    return  rc;
}
