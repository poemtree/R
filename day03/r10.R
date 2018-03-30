library(dplyr)
exam <- read.csv('csv_exam.csv')

# group_by()와 summarise()를 이용하여 그룹별로 요약할 수 있다.

# summarise() -- 요약하기.. 그루핑이 되지 않아 전체를 요약한다..
exam %>% summarise(mean_math = mean(math))

# group_by()로 그루핑할 컬럼을 지정하고 summarise()로 요약한다.
exam %>% group_by(class) %>% summarise(mean_math = mean(math))

exam %>% group_by(class) %>% summarise(sum_math = sum(math))

# 여러 요약 통계를 한 번에 산출하기
exam %>% group_by(class) %>% summarise(mean_math = mean(math), sum_math = sum(math), median_math = median(math), n = n())
# n()은 행 수를 카운트 하는 기능을 한다.

###################################################
# summarise()에서 자주 사용되는 요약 통계량 함수
# mean()    -- 평균
# sd()      -- 표준편차
# sum()     -- 합계
# median()  -- 중앙값
# min()     -- 최소값
# max()     -- 최대값
# n()       -- 빈도
###################################################

# 다중 그루핑 -- group_by에 입력한 순서대로 정렬 된다..

mpg %>% group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty)) %>%
  head(10)

mpg %>% group_by(manufacturer, desc(drv)) %>%
  summarise(mean_cty = mean(cty)) %>%
  head(10)
