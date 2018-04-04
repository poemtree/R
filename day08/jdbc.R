# Oracle�� R�� ������ �ռ� sqldf�� �̿��� R���� SQL�� �̿��غ���
library(sqldf)
library(dplyr)

str(iris)
class(iris)

# iris�� �����͸� �������� �پ��� ���..
mydata <- sqldf("SELECT * FROM iris WHERE Species='setosa'")

mydata2 <- iris[iris$Species=='setosa',]

mydata3 <- iris %>% filter(Species=='setosa')

data <- iris

colnames(data) <- c('sl', 'sw', 'pl', 'pw', 's')

# ���� �� �� ��� ���ϱ�

sqldf("SELECT s, AVG(sl) AS 'mean_SL', AVG(sw) AS 'mean_SW', AVG(pl) AS 'mean_PL', AVG(pw) AS 'mean_PW' FROM data GROUP BY s")

v1 <- data %>% group_by(s) %>% summarise(mean_SL = mean(sl), mean_SW = mean(sw), mean_PL = mean(pl), mean_PW = mean(pw))

cbind(aggregate(sl~s,data,mean),sw=aggregate(sw~s,data,mean)$sw,pl=aggregate(pl~s,data,mean)$pl,pw=aggregate(pw~s,data,mean)$pw)

apply(data[,c(1:4)],2,tapply,INDEX=data$s,mean)

# ǥ �׷�����

ggplot(data=data, aes(x=sl,y=pl))+geom_line()

# apply�� aggregate�� ����� ���� �Լ� �̿��ϱ�...

fmax <- function(v1){
  return(max(v1))
}
fmin <- function(v1){
  return(min(v1))
}
aggregate(sl~s,data,fmax)
aggregate(sl~s,data,fmin)