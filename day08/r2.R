# 본격적으로 R과 Java를 연동해보자..
# 우선 필요한 패키지들을 설치하고 로드 한다.
# install.packages('rjava')
# install.packages('RJDBC')
# install.packages('DBI')

library(rJava)
library(RJDBC)
library(DBI)
library(ggplot2)

# 연동은 아래와 같은 순서로 진행이 된다.
# 1. Driver Loading
# 2. Connection
# 3. Statement
# 4. ResultSet
# 5. Close

# 필요한 변수 선언하기
drvName <- 'oracle.jdbc.driver.OracleDriver'
url <- 'jdbc:oracle:thin:@localhost:1521:xe'
id <- 'ruser2'
pw <- '111111'

# Driver Loading
drv <- JDBC(driverClass = drvName,classPath='c:\\java_hive_lib\\ojdbc6.jar')

# Connection
conn <- dbConnect(drv, url, id, pw)

# Statement
sqlstr <- 'SELECT * FROM EMP';

# ResultSet
emp <- dbGetQuery(conn, sqlstr)

# Close
dbDisconnect(conn)

# 1. emp 회사의 근속 연수(오늘날짜 기준)와 월급의 상관 관계를
# 표로 표현하시오. 근속은 월로 계산한다.

# 일 계산일 경우..
ggplot(data=emp,aes(x=Sys.Date()-as.Date(substr(emp$HIREDATE,1,10)),y=emp$SAL))+geom_line()

# 월 계산일 경우.. 복잡하다.. POSIXlt로 형변환하여 날짜를 쪼개
# 사용할 수 있도록 만들어야 한
nowDate <- as.POSIXlt(Sys.Date())
(nowDate$year-as.POSIXlt(substr(emp$HIREDATE,1,10))$year)*12+(nowDate$mon-as.POSIXlt(substr(emp$HIREDATE,1,10))$mon)

ggplot(data=emp,aes(x=(nowDate$year-as.POSIXlt(substr(emp$HIREDATE,1,10))$year)*12+(nowDate$mon-as.POSIXlt(substr(emp$HIREDATE,1,10))$mon), y= emp$SAL)) + geom_line()

# DML을 이용해 가져오면 아주 쉽게 할 수 있다..

sqlstr <- 'select trunc(months_between(sysdate,HIREDATE)) AS MONThSAL,SAL from emp'

conn <- dbConnect(drv, url, id, pw)

emp <- dbGetQuery(conn, sqlstr)


# 그래프 겹쳐 그리기
pressure2 <- pressure*2

ggplot(pressure,aes(x=temperature,y=pressure))+geom_point()+  geom_line()+geom_line(data=pressure2, aes(x=temperature, y=pressure/2), colour="red") + geom_point(data=pressure2, aes(x=temperature, y=pressure/2), colour="red")







