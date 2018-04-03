# 지도 시각화..
# 지역별 통계치를 색깔의 차이로 표현한 지도를 '단계 구분도
# (Choropleth Map)'라고 한다. 

# ggiraphExtra 패키지를 이용해 쉽게 표현할 수 있다.
# 한국 지도를 이용하기 위해 kormaps2014 패키지를 설치 해야 한다.
# 이 패키지는 R 서버에서 등록이 되지 않아 devtoos를 이용해
# 깃허브(github)에서 받아야 한다. 아래와 같이 설치를 진행한다.

# install.packages('ggiraphExtra')
# install.packages('stringi')
# install.packages('devtools')
# devtools::install_github('cardiomoon/kormaps2014')
# devtools::install_github('cardiomoon/moonBook2')

library(kormaps2014)
library(stringi)
library(ggiraphExtra)
library(dplyr)
library(moonBook2)
library(ggplot2)

# kormaps2014에 포함된 샘플 데이터 중 시도별 인구통계 정보가 담겨
# 있는 korpop1 데이터를 이용해 시도별 인구 단계 구분도를 만들자.

korpop1

# korpop1 데이터는 인코딩이 UTF-8로 되어있어 윈도우에서는 한글
# 문자가 깨져 보이므로 changeCode()를 이용해 CP949로 인코딩 변환
# 후 str()에 적용하면 깨지지 않고 정보를 볼 수 있다.
str(changeCode(korpop1))

theme_set(theme_gray(base_family="NanumGothic"))

ggplot(testkor,aes(map_id=code,fill=총인구_명))+
  geom_map(map=kormap1,colour="black",size=0.1)+
  expand_limits(x=kormap1$long,y=kormap1$lat)+
  scale_fill_gradientn(colours=c('white','orange','red'))+
  ggtitle("2015년도 시도별 인구분포도")+
  coord_map()
