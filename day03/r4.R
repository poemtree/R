library(ggplot2)

# 1. ggplot2의 midwest 데이터를 데이터 프레임 형태로 볼러온 다음 데이터의 특징을
# 파악하세요.

str(midwest)

# 2. poptotal(전체인구) 변수를 total로, popasian(아시아 인구)변수를 asian으로
# 수정하세요.

testMidWest <- rename(midwest, total=poptotal, asian = popasian)

# 3. total, asian 변수를 이용해 '전체인구 대비 아시아 인구 백분율' 파생변수를 만들고,
# 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보세요

testMidWest$asian_to_total <- testMidWest$asian/testMidWest$total*100

hist(testMidWest$asian_to_total)

# 4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.

testMidWest$a2t_size <- ifelse(testMidWest$asian_to_total > mean(testMidWest$asian_to_total), 'large', 'small')

# 5. "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대 그래프를
# 만들어 확인해 보세요.
table(testMidWest$a2t_size)

qplot(testMidWest$a2t_size)
