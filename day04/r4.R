library(ggplot2)
ggplot(data=mpg, aes(x=displ, y=hwy)) +
  geom_point() +
  geom_line() + 
  xlim(1,8) +
  ylim(10, 50)

# 1. mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비)간에 어떤
# 관계가 있는지 알어보려고 한다. x축은 cty, y축은 hwy로 된 산점도
# 만들어 보자

ggplot(data=mpg, aes(x=cty, y=hwy)) + geom_point()

# 2. 전체 인구와 아시아인 인구 간에 어떤 관계가 어떤 관계가 있는
# 지 알아보려 한다. x축은 poptotal(전체 인구), y축은 (popasian)
# (아시아인 인구)로 된 산점도를 만드시오. 전체 인구는 50만 명 이하
# 아시아인 인구는 1만 명 이하인 지역만 산점도에 표시한다.
library(dplyr)
ggplot(data = midwest %>% filter(poptotal>=500000&popasian>=10000), aes(x=poptotal, y=popasian)) + geom_point()
