st <- read.csv('excel_exam.csv', header=FALSE)

# 결측치(Missing Value)는 누락된 값, 비어 있는 값을 의미한다. 실제 데이터는 수집과정에서
# 발생한 오류로 인해 결측치를 포함하고 있는 경우가 많다.
# 결측치가 있으면 함수가 적용되지 않거나 분석 결과가 왜곡되는 문제가 발생한다.

View(st)
colnames(st) <- c('id','class','ko','en','ma')

# 결측치 확인하기
# is.na()를 이용하여 확인할 수 있다.
# is.na()를 table()에 적용하면 데이터에 결측치가 총 몇개 있는지를 출력 한다.

table(is.na(st$class))

# 결측치 제거하기
# is.na()를 filter()에 적용하면 결측치가 있는 행을 출력할 수 있다.

library(dplyr)

st %>% filter(is.na(class))

# !is.na()를 이용하여 반대로 결측치가 없는 행을 출력할 수 있다.

st %>% filter(!is.na(class))

# 여러 컬럼에 결측치가 있다면 filter()에 '&'기호를 이용해 조건을 나열하면 된다.

st %>% filter(!is.na(class)&!is.na(ko)&!is.na(en)&!is.na(ma))

# 위에서는 !is.na()를 결측치가 있는 열 만큼 입력하였으나 na.omit()을 이용하면
# 한번에 모든 행을 제거할 수 있다.

na.omit(st)

st %>% na.omit(st)

# 함수의 결측치 제외 기능
# mean()과 같은 대부분의 수치 연산 함수들은 결측치를 제외할 수 있는 na.rm
# 파라미터를 지원한다, ma.rm을 TRUE로 설정하면 결측치를 제외하고 연산한다.
# 하지만 모든 함수가 이를 지원하는 것은 아니다.

mean(st$ko)
mean(st$ko, na.rm = TRUE)

sum(st$ko)
sum(st$ko, na.rm = TRUE)

# summrise()를 이용해 요약 통계량을 산출할 때에도 na.rm 파라미터를 적용할 수 있다.
st %>% summarise(mean_ma = mean(ma))
st %>% summarise(mean_ma = mean(ma, na.rm = TRUE))

# 국어, 영어, 수학 성적의 평균을 구하여 vector를 만들어라
avg <- colMeans(st[,c('ko','en','ma')], na.rm = TRUE)

# NA 값을 모두 0으로 바꿔라
st$ko <- ifelse(is.na(st$ko), 0, st$ko)
st$en <- ifelse(is.na(st$en), 0, st$en)
st$ma <- ifelse(is.na(st$ma), 0, st$ma)

st2 <- read.csv('excel_exam.csv', header=F
                ALSE)
colnames(st2) <- c('id','class','ko','en','ma')

# 모든 결측치를 한번에 0으로 교체하지만 바뀌지 말아야 할 컬럼 까지 바뀔 수
# 있으니 조심하자

st2[is.na(st2)] <- 0

# 박스플롯.. 극단치 표준편차 등..
boxplot(st$ko)



