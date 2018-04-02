library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

# 데이터를 데이터 프레임 형태로 변수에 저장
raw_eslfare <- read.spss(file="Koweps_hpc10_2015_beta1.sav", to.data.frame = TRUE)

# 원본 수정을 막기 위해 복사하여 사용
welfare <- raw_eslfare

# 데이터의 정보 조회
str(welfare)

# 분석에 사용할 컬럼 명을 이용하기 쉽게 변경한다.
welfare <- rename(welfare,
                  sex=h10_g3,
                  birth=h10_g4,
                  marriage=h10_g10,
                  religion=h10_g11,
                  income=p1002_8aq1,
                  code_job=h10_eco9,
                  code_region=h10_reg7)

# 성별에 따른 월급 평균을 구하기 위해 데이터를 확인 한다.
# 1:남자, 2:여자, 9:이상치
table(welfare$sex)

# 다행히 이상치가 없기 때문에 결측 처리는 불필요하다.
# 만약 이상치가 있다면 결측 처리 후 결측치가 정상적으로 입력 되었는지 확인해야 한다.
# 이제 성별을 1과 2가 아닌 문자로 바꾸어 의미를 이해하기 쉽게 만든다.

welfare$sex <- ifelse(welfare$sex == 1, 'male', 'female')

table(welfare$sex)

# income 변수를 확인한다.
class(welfare$income)

# income 변수는 연속된 숫자이기 때문에 table로 확인하면 너무 많은 항목이 출력된다.
# 이럴땐 summary()로 요약 통계를 확인하자
summary(welfare$income)

qplot(welfare$income)

# qplot()은 최대값까지 표현하도록 기본값이 설정되어있다, 출력된 그래프를 보면 x축이
# 2500까지 표현되어 대다수를 차지하는 0~1000 사이 데이터가 잘 표현되지 않고있다.
# xlim()을 이용해 0~1000까지만 표현하도록 설정하자

qplot(welfare$income) + xlim(0, 1000)

# income은 1~9998 사이의 값을 지니며, 모름 또는 무응답은 9999로 설정되어 있다.
# 출력된 요약 통계를 보면 최소값이 0으로 보인다 이는 이상치가 존재한다는 것을
# 의미하므로 값이 0이면 결측 처리를 해야 한다. 값이 0이거나 9999일 경우 결측처리
# 를 하여 제외하고 분석하도록 하자

welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)

table(is.na(welfare$income))

# 총 4620개의 이상치를 결측처리 하였다. 이제 !is.na를 활용하여 결측치를 제하고
# 데이터를 분석하면 된다.

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

# sex_income을 확인한다.

sex_income

ggplot(data=sex_income, aes(x=sex, y=mean_income)) + geom_col()

# 데이터를 보면 남성의 평균 월급이 여성보다 약 150만원 더 많다는 것을 알 수 있다.

