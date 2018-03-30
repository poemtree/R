library(dplyr)
exam <- read.csv('csv_exam.csv')

# select() -- 데이터 중 특정 열만 추출하고자 할 때 사용한다.

# 특정 열 추출하기
exam %>% select(math)

# 여러 열 추출하기 -- IN을 안써도 된다...
exam %>% select(class, math, english)

# 변수 제외하기
exam %>% select(-math)
exam %>% select(-math, -english)

# dplyr 함수 조합하기

# filter()와 select() 조합하기
# 1반 학생들의 영어 점
exam %>% filter(class == 1) %>% select(english)

exam %>%
  filter(class == 1) %>%
  select(english)

# 상기 처럼 줄바꿈을 할 경우 꼭 전체를 구문선택하여 실행하여야 오류가 안난다.

# 일부만 출력하기 -- 추출이 아니다...
# head를 사용하면 6행 까지만 출력되며 head(숫자)를 사용하면 숫자 만큼 출력 된다.
exam %>% select(id, math) %>% head(5)

# tail은 아래에서 위로... 기본 출력 숫자와 지정 방법은 head와 동일..
exam %>% select(id, math) %>% tail()
