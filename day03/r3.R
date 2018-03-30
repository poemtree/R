library(ggplot2)

tf <- data.frame(x=c(1:5),y=c(6:10))
tfc <- tf
colnames(tfc) <- c('Col1', 'Col2')

tfc <- rename(tf,'xx1'=x)

mpg <- rename(mpg, 'city'='cty', 'higway'='hwy')

mpg$total <- (mpg$city+mpg$higway)/2

hist(mpg$total)

mpg$test <- ifelse(mpg$total >= 20, 'PASS','FAIL')
as.vector(table(mpg$test))
qplot(mpg$test)

# total연비를 3등급으로 나누고자 한다.
# 30이상  A
# 20~29   B
# 20미만  C
# grade라는 컬럼을 만들어 추가한다.
# grade를 기준으로 그래프를 그린다.

mpg$grade <- ifelse(mpg$total >= 30, 'A',(ifelse(mpg$total >= 20, 'B', 'C')))

qplot(mpg$grade)
