name <-c('김지훈','이유진','박동현','김민지')
gender <- c('m','f','m','f')

ko <- c(90,80,60,70)
ma <- c(50,60,100,20)
si <- c(87,54,79,89)
en <- c(54,67,87,88)
add<- c('서울시','광주시','대전시','부산시')
df<- data.frame(name,gender,ko,ma,si,en,add)
df

tmp <- df[,'add']
class(tmp)
tmp2 <- as.character(tmp)
class(tmp2)
substr(tmp2, 1, 2)

dfm <- df[df$gender=='m',];
dff <- df[df$gender=='f',]

mavg <- colMeans(dfm[,3:6])
favg <- colMeans(dff[,3:6])

df[rowMeans(df[,3:6])>=mean(colMeans(df[3:6])),]

v2 <- rowMeans(df[,c('ko','en')]);
names(v2) <- df$name;
v2

r1 <- colMeans(df[df$gender=='f', 3:6]);
r2 <- colMeans(df[df$gender=='m', 3:6]);

names(r1) <- colnames(df)[3:6]
names(r2) <- colnames(df)[3:6]

r3 <- rbind(r1,r2)

r4 <- as.data.frame(r3)

class(r2)
class(r3)
class(r4)






