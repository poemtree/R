library(dplyr)

# dplyr 패키지는 함수를 조합할 때 진가를 발휘한다. 절차가 복잡해 보이는 분석도
# dplyr 함수를 조합하면 코드 몇 줄로 간단히 해결 가능하다.

# dplyr 조합하기
# mpg를 사용하여 회사별 suv 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순
# 으로 정렬하고, 1~5위 까지 출력하시오.

mpg %>% group_by(manufacturer, model) %>%   # 회사별로 분리
  filter(class== 'suv') %>%                 # suv 추출
  mutate(avg= (cty+hwy)/2) %>%              # 통합 연비 컬럼 생성
  summarise(mean_avg = mean(avg)) %>%       # 통합 연비의 평균 산출
  arrange(desc(mean_avg)) %>%                     # 내림차순으로 정렬
  head(5)                                   # 1~5순위까지 출

# 1. class별 cty 평균을 구하시오.
mpg %>% group_by(class) %>% summarise(mean_cty = mean(cty))

# 2. cty 평균이 높은 순으로 정렬하시오.
mpg %>% group_by(class) %>% summarise(mean_cty = mean(cty)) %>% arrange(desc(mean_cty))

# 3. hwy 평균이 가장 높은 회사 세 곳을 출력하시오.
mpg %>% group_by(class) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

# 4. 각 회사별 compact 차종 수를 내림차순으로 정렬해 출력하시오.
mpg %>% group_by(manufacturer) %>%
  filter(class=='compact') %>%
  summarise(n_compact = n()) %>%
  arrange(desc(n_compact))
