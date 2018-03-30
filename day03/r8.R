library(dplyr)
exam <- read.csv('csv_exam.csv')

# arrange() -- 원하는 순서대로 정렬한다. 함수 안에 기준 컬럼을 입력한다.

# 오름차순으로 정렬하기
exam %>% arrange(math)

# 내림차순으로 정렬하기
exam %>% arrange(desc(math))

# 여러개의 기준으로 정렬하기 -- 입력한 순서대로 정렬 된다..
exam %>% arrange(class, math)

exam %>% arrange(desc(class), desc(math))
# exam %>% arrange(desc(class, math)) 은 될 것 같지만 안된다... 주의 하

# 오름과 내림차순 혼용
exam %>% arrange(class, desc(math))

# 1. 각 반 별 3과목 평균이 높은 사람 순으로 정렬 하시오.

ex1 <- cbind(exam, avg=round(rowMeans(exam[3:5]),2))

ex1 %>% arrange(class, desc(avg))
