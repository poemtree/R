# Oracle과 R의 연동에 앞서 sqldf를 이용해 R에서 SQL을 이용해보자
library(sqldf)
library(dplyr)

str(iris)
class(iris)

# iris의 데이터를 가져오는 다양한 방법..
mydata <- sqldf("SELECT * FROM iris WHERE Species='setosa'")

mydata2 <- iris[iris$Species=='setosa',]

mydata3 <- iris %>% filter(Species=='setosa')

data <- iris

colnames(data) <- c('sl', 'sw', 'pl', 'pw', 's')

# 꽃의 종 별 평균 구하기

sqldf("SELECT s, AVG(sl) AS 'mean_SL', AVG(sw) AS 'mean_SW', AVG(pl) AS 'mean_PL', AVG(pw) AS 'mean_PW' FROM data GROUP BY s")

v1 <- data %>% group_by(s) %>% summarise(mean_SL = mean(sl), mean_SW = mean(sw), mean_PL = mean(pl), mean_PW = mean(pw))

cbind(aggregate(sl~s,data,mean),sw=aggregate(sw~s,data,mean)$sw,pl=aggregate(pl~s,data,mean)$pl,pw=aggregate(pw~s,data,mean)$pw)

apply(data[,c(1:4)],2,tapply,INDEX=data$s,mean)

# 표 그려보기

ggplot(data=data, aes(x=sl,y=pl))+geom_line()

# apply와 aggregate에 사용자 정의 함수 이용하기...

fmax <- function(v1){
  return(max(v1))
}
fmin <- function(v1){
  return(min(v1))
}
aggregate(sl~s,data,fmax)
aggregate(sl~s,data,fmin)
