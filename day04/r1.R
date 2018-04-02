library(dplyr)

tf <- data.frame(
  id=c(1:5),
  test=c(86:90)
)

tf2 <- data.frame(
  id=c(6:10),
  test=(91:95)
)
total <- rbind(tf,tf2)

total$test2 <- (90:99)

# total에 test와 test2 평균 열을 추가.. 두가지 방법이 있다.

total$avg <- rowMeans(total[2:3])

total <- total %>% mutate(avg2=(test+test2)/2)

# 평균이 높은 순으로 탑3를 조회 하시오. 
head(total[order(total$avg,decreasing=TRUE),],3)

total %>% arrange(desc(avg)) %>% head(3)

# 평균이 전체 평균 이상인 학생을 조회 하시오.
total %>% filter(avg>=mean(avg))
total[total$avg >= mean(total$avg),]
