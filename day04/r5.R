library(dplyr)
library(ggplot2)
mpg2 <- mpg %>% select(drv, hwy)

result <- mpg2 %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy))

ggplot(data=result, aes(x=reorder(drv,-mean_hwy), y=mean_hwy)) + geom_col()

ggplot(data=mpg, aes(x=drv))+geom_bar()

ggplot(data=mpg, aes(x=hwy))+geom_bar()

# suv 차종을 대상으로 평균 cty가 가장 노은 회사 다섯 곳을 막대
# 그래프로 표현하시오, 정렬은 내림 차순

ggplot(data = mpg %>% filter(class=='suv') %>% select(manufacturer, class, cty) %>% group_by(manufacturer) %>% summarise(mean_cty=mean(cty)) %>% arrange(desc(mean_cty)) %>% head(5), aes(x=reorder(manufacturer,-mean_cty), y=mean_cty)) + geom_col() + ylim(0,20)

# 자동차 종류별 빈도를 표현한 막대 그래프를 그려보시오
ggplot(data=mpg, aes(x=class)) + geom_bar()
