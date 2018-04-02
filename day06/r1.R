# SPSS 전용 파일을 읽기 위해서 foreign 패키지를 설치하자
# install.packages("foreign")
# http://bit.ly/Koweps_hpc10_2015_v2 데이터는 링크를 통해 받을 수 있다.


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
  