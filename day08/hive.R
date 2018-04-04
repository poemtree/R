library(rJava)
library(RJDBC)
library(DBI)

drvName <- 'org.apache.hive.jdbc.HiveDriver'
id <- 'root'
pw <- '111111'
url <- 'jdbc:hive2://192.168.111.100:10000'


# Hive를 이용하기 위해 jar 파일을 올린다..
hive_lib <-'c:\\java_hive_lib'
.jinit();
.jaddClassPath(dir(hive_lib,full.names = T));
.jclassPath();

#1. Driver Loading
drv <-JDBC(driverClass = drvName,classPath = 'hive-jdbc-1.0.1.jar')
#2. Connection
conn <- dbConnect(drv,url,id,pw)
#3. statement
sqlstr <- 'SELECT * FROM airline_delay LIMIT 10';
#4. ResultSet
pm <- dbGetQuery(conn,sqlstr);
#5. close
dbDisconnect(conn)
