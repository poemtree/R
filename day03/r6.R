# dplyr은 데이터 전처리 작업에 가장 많이 사용되는 패키지이다.
# install.packages('dplyr')

library(dplyr)

exam <- read.csv('csv_exam.csv')
colnames(exam) <- c('id','class','math','english','science')

# dplyr 패키지는 %>% 기호를 이용하여 사용할 함수를 나열한다.

# filter() -- 안에 조건을 주어 해당하는 행만 추출한다.

# 1학급인 학생을 추출
exam %>% filter(class ==1)

# 1학급이 아닌 학생을 추출
exam %>% filter(class != 1)

# 수학점수가 50정을 초과한 학생을 추출
exam %>% filter(math > 50)

# 여러 조건을 충족하는 행 추출하기 (AND 연산) -- '&'
exam %>% filter(class == 1 & math >= 50)

# 여러 조건 중 하나 이상 충족하는 행 추출하기 (OR 연산) -- '|'
exam %>% filter(math >= 90 | english >= 90)

# 목록에 해당하는 행 추출하기 (다중 OR연산 = IN 연산) -- '조건|조건|조건' 또는 '%in%'
# 개인 적으로는 IN 연산을 사용하는게 더욱 편하다는 소견...
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))

# mpg 데이터를 이용해 아래 문제를 해결해자.
# 1. displ(배기량)이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 hwy(고속도로
# 연비)가 평균적으로 높은지 알아보시오.

ifelse(mean((mpg %>% filter(displ<=4))$hwy) > mean((mpg %>% filter(displ>=5))$hwy),'4 이하인 자동차', '5 이상인 자동차')

# audi와 totyta 중 어느 manufacturer(제조회사)의 cty(도시 연비)가 평균적으로 더 높은지 알아보시오.

ifelse(mean((mpg %>% filter(manufacturer=='audi'))$cty) > mean((mpg %>% filter(manufacturer=='toyota'))$cty),'audi', 'toyota')

# chevrolet, ford, honda 들의 hwy 전체 평균을 구해보시오.

mean((mpg %>% filter(manufacturer %in% c('chevrolet', 'ford', 'honda')))$hwy)
