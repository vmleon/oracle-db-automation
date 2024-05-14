# Notes

## Oracle Database

```sql
SELECT CON_ID, DBID, NAME, APPLICATION_ROOT, APPLICATION_PDB, PDB_COUNT from V$CONTAINERS;
```

```sql
SELECT name from v$DATABASE;
```

## SQLcl

### Useful commands

```
show tns
```

```
show connection
```

```
show all
```

```
show all+
```

```
tables
```

```
desc TABLE_NAME;
```

```
info TABLE_NAME;
```

```
select /*json*/ sysdate from dual;
```

```
set load scan_rows 5000
load activities activities.csv new
```

### Spooling

```
cd /home/opc/
```

```
spool regions.sql
ddl regions
select * from regions;
spool off
```

```
!ls *regions*
```

### Data Pump

```
help datapump
```

```
datapump ex help
```

```
datapump im help
```

### Data Guard

```
help dg
```

### Liquibase

```
help lb
```

```
lb genschema
```

XML files with the schema changelog are created `!ls *.xml`

```
lb update controller.xml false
```

`false` ignore schema attached

When working with the next version of the database.

```
cd v2
```

```
lb genschema
```

Dry run:

```
lb updatesql controller.xml false
```

Apply changes:

```
lb update controller.xml false
```

### Help and others

```sql
select * from employees fetch first 10 rows only;
```

```sql
select /*inserts*/ * from TABLE_NAME;
```

```sql
help oci
```

```sql
show cs
```

### Create connection (and save password)

```sql
conn -save CONNECTION_NAME -savepwd
```

```sql
conn -save CONNECTION_NAME -url service_high -u ADMIN -password 'PASSWORD' -savepwd
```

```bash
sql -name CONNECTION_NAME
```

### Object Storage

```sql
oci profile freedb
cs <OBJECT_STORAGE_PAR_FULL_URL>
cs list
cs peek /o/mylocs.csv
```

### Format

```
set sqlformat delimiter ;
```

```
show sqlformat;
```

```
help set sqlformat
```
