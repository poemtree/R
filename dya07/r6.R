library(RgoogleMaps)
library(dplyr)
library(readxl)
library(moonBook2)

# 서울시 무료 wifi 데이터를 가지고 지도에 좌표를 표시해보자
# 1이 입력되면 KT, 2는 LG, 3은 SKT의 wifi를 표시한다.

# csv 파일 읽어오기.. 인코딩이 UTF-8이면 한글이 깨진다.. ANSI로
# 파일 자체의 인코딩을 변경한 후 아래와 같이 불러오자..
seoul_wifi <- read.csv('seoulwifi.csv', header = TRUE, stringsAsFactors = FALSE, encoding = 'ANSI')

data <- seoul_wifi

colnames(data) <- c('district', 'type', 'place', 'X', 'Y', 'corporation')

mycenter = c(37.501246, 127.039456)

mymap <- GetMap(
  center = mycenter,
  zoom = 11,
  maptype = 'road',
  format = 'roadmap',
  destfile = 'mymap.jpg'
)

wifi <- function(num){
  
  corp <- ifelse(num==1,'KT',ifelse(num==2,'LGU+', 'SKT'))
  color <- ifelse(num==1,'blue',ifelse(num==2,'pink', 'red'))
  
  jpeg(filename = paste0(corp,'.jpg'), width = 680, height = 680, quality = 100);
  mydata <- data.frame(
    a = c(1: as.integer(data %>% filter(corporation==corp) %>% summarise(n()))),
    data %>% filter(corporation==corp) %>% select(Y),
    data %>% filter(corporation==corp) %>% select(X)
  )
  p <- PlotOnStaticMap(
    mymap,
    lat = mydata$Y,
    lon = mydata$X,
    destfile = paste0(corp,'.jpg'),
    cex = 1,
    pch = 10,
    col = color
  )
  print(p)
  dev.off()
}
