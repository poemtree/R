# 1. 데이터 수집
# 2. Developer를 이용하여 테이블 생성 및 입력..
# 3. R을 이용하여 데이터를 분석..

library(rJava)
library(RJDBC)
library(DBI)
library(dplyr)

drvName <- 'org.apache.hive.jdbc.HiveDriver'
id <- 'root'
pw <- '111111'
url <- 'jdbc:hive2://192.168.111.100:10000'

hive_lib <-'c:\\java_hive_lib'
.jinit();
.jaddClassPath(dir(hive_lib,full.names = T));
.jclassPath();

drv <-JDBC(driverClass = drvName,classPath = 'hive-jdbc-1.0.1.jar')

conn <- dbConnect(drv,url,id,pw)

sqlstr <- 'SELECT * FROM street_trees';

st <- dbGetQuery(conn,sqlstr);

sqlstr <- 'SELECT * FROM population_density';

pd <- dbGetQuery(conn,sqlstr);

dbDisconnect(conn)

head(st)

st <- st[-1,]
pd <- pd[-1,]

colnames(st) <- c('year' , 'district' , 'line_num' , 'ginkgo' , 'sycamore' , 'zelkova' , 'cherry' , 'silver_maple' , 'metasequoia' , 'locust' , 'ailanthus' , 'persimmon' , 'weeping_willow' , 'tulip_poplar', 'horse_chestnut', 'poplar' , 'elm' , 'apricot' , 'rose_of_sharon' , 'pine' , 'magnolia' , 'retusa_fringetree' , 'etc' )

qqplot(data= st %>% filter(year %in% c(2012, 2016)), aes())




