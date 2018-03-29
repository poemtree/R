library(readxl);
library(ggplot2);
getcsv <- function(fname, h) {
  data <- read.csv(fname, header = h, stringsAsFactors = TRUE, encoding = 'ANSI')
  return(data)
}

st <- getcsv('C:\\Users\\student\\Desktop\\st.csv', TRUE)
pd <- getcsv('C:\\Users\\student\\Downloads\\pd.csv', TRUE)


st2012 <- rowSums(st[st$year=='2012',4:17])
names(st2012) <- st[st$year=='2012',2]

st2016 <- rowSums(st[st$year=='2016',4:17])
names(st2016) <- st[st$year=='2016',2]

st1 <- rbind(st2012=st2012,st2016=st2016)
st1 <- rbind(st1, change=(st2016-st2012))
st1 <- st1[,-c(26:28)]
st1 <- cbind(st1, tot=rowSums(st1))

st2 <- as.data.frame(st1)

pd2012 <- rowSums(pd[pd$year=='2012',4:5])
names(pd2012) <- pd[pd$year=='2012',2]
pd2016 <- rowSums(pd[pd$year=='2016',4:5])
names(pd2016) <- pd[pd$year=='2016',2]

pd1 <- rbind(pd2012=pd2012,pd2016=pd2016)
pd1 <- rbind(pd1, change=(pd2016-pd2012))
pd1 <- cbind(pd1, tot=rowSums(pd1))

pd2 <- as.data.frame(pd1)

qplot(pd2$tot)
