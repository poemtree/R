library(ggplot2)
library(dplyr)

# 미국 동북중부 437개 지역의 인구통계 정보를 담고 있는 midwest 데이터를 사용해
# 데이터 분석 문제를 해결해 보세요. midwest는 ggplot2 패키지에 들어 있습니다.

# 1. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타냅니다.
# midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 변수를 추가하세요.
midwest2 <- midwest %>% mutate(perunderage=(poptotal-popadults)/poptotal*100)

# 2. 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 미성년 인구 백분율을
# 출력하세요.

midwest2 %>% select(county, perunderage) %>% arrange(desc(perunderage)) %>% head(5)

# 3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의
# 지역이 있는지 알아보세요.

midwest2 <- midwest2 %>% mutate(grade_perunderage=ifelse(perunderage>=40,'large',ifelse(perunderage>=30,'middle', 'small')))

midwest2 %>% group_by(grade_perunderage) %>% summarise(count_grade_perunderage = n()) 

# 4. popasian은 해당 지역의 아시아인 인구를 나타냅니다. '전체 인구 대비 아시아인
# 인구 백분율' 변수를 추가하고 하위 10개 지역의 state(주), county(지역), 아시아인
# 인구 백분율을 출력하세요.

midwest2 <- midwest2 %>% mutate(perasian=popasian/poptotal*100)
midwest2 %>% select(state, county, perasian) %>% arrange(perasian) %>% head(10)
