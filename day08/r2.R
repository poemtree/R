# ���������� R�� Java�� �����غ���..
# �켱 �ʿ��� ��Ű������ ��ġ�ϰ� �ε� �Ѵ�.
# install.packages('rjava')
# install.packages('RJDBC')
# install.packages('DBI')

library(rJava)
library(RJDBC)
library(DBI)
library(ggplot2)

# ������ �Ʒ��� ���� ������ ������ �ȴ�.
# 1. Driver Loading
# 2. Connection
# 3. Statement
# 4. ResultSet
# 5. Close

# �ʿ��� ���� �����ϱ�
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

# 1. emp ȸ���� �ټ� ����(���ó�¥ ����)�� ������ ��� ���踦
# ǥ�� ǥ���Ͻÿ�. �ټ��� ���� ����Ѵ�.

# �� ����� ���..
ggplot(data=emp,aes(x=Sys.Date()-as.Date(substr(emp$HIREDATE,1,10)),y=emp$SAL))+geom_line()

# �� ����� ���.. �����ϴ�.. POSIXlt�� ����ȯ�Ͽ� ��¥�� �ɰ�
# ����� �� �ֵ��� ������ ��
nowDate <- as.POSIXlt(Sys.Date())
(nowDate$year-as.POSIXlt(substr(emp$HIREDATE,1,10))$year)*12+(nowDate$mon-as.POSIXlt(substr(emp$HIREDATE,1,10))$mon)

ggplot(data=emp,aes(x=(nowDate$year-as.POSIXlt(substr(emp$HIREDATE,1,10))$year)*12+(nowDate$mon-as.POSIXlt(substr(emp$HIREDATE,1,10))$mon), y= emp$SAL)) + geom_line()

# DML�� �̿��� �������� ���� ���� �� �� �ִ�..

sqlstr <- 'select trunc(months_between(sysdate,HIREDATE)) AS MONThSAL,SAL from emp'

conn <- dbConnect(drv, url, id, pw)

emp <- dbGetQuery(conn, sqlstr)


# �׷��� ���� �׸���
pressure2 <- pressure*2

ggplot(pressure,aes(x=temperature,y=pressure))+geom_point()+  geom_line()+geom_line(data=pressure2, aes(x=temperature, y=pressure/2), colour="red") + geom_point(data=pressure2, aes(x=temperature, y=pressure/2), colour="red")






