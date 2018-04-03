# RgoogleMaps 패키지를 이용하면 구글맵을 이용할 수 있다.
# 구글맵을 이용하는 방법에 대해 알아보자
# install.packages('RgoogleMaps')

library(RgoogleMaps)

# 지도의 중심이 될 좌표를 저장한다.
mycenter = c(37.501246, 127.039456)

# 지도를 mymap.jpg로 저장한다.
mymap <- GetMap(
  center = mycenter,
  zoom = 11,
  maptype = 'road',
  format = 'roadmap',
  destfile = 'mymap.jpg'
)

# 만들어진 지도에 포인트를 찍는다.
PlotOnStaticMap(
  mymap,
  lat = 37.501246,
  lon = 127.039459,
  destfile = 'mymap1.jpg',
  cex = 1,
  pch = 10,
  col = 'red'
)

# 파일로 저장하기..
jpeg(filename = 'mymap1.jpg', width = 680, height = 680, quality = 100);
mydata <- data.frame(
  a=c(1:5),
  lat = c(37.501343, 37.503572, 37.524244, 37.483148, 37.569056),
  lon = c(127.039580, 127.030568, 127.032822, 126.988673, 127.057291)
)
p <- PlotOnStaticMap(
  mymap,
  lat = mydata$lat,
  lon = mydata$lon,
  destfile = 'mymap1.jpg',
  cex = 1,
  pch = 10,
  col = 'red'
)
print(p)
dev.off()





