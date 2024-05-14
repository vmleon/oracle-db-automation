COLUMN global_name new_value gname
SET TERMOUT OFF
SELECT LOWER(USER) || '@' || global_name||CHR(10)||'SQL> ' AS global_name
FROM global_name;
SET SQLPROMPT '&gname'
SET TERMOUT ON
ALTER SESSION SET nls_date_format = 'yyyy-mm-dd hh:mi:ssPM';
SET pagesize 2000
SET LONG 10000
SET linesize 1000
COLUMN last_name format a20
COLUMN total format 999,999,999
SET feedback ON
SET WRAP ON
SET HEADING OFF