t1 <- matrix(c(97, 97, 97, 97, 97, 97, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99), 6, 6, TRUE);
rownames(t1) <- c('kim', 'lee', 'hong', 'jang', 'park', 'yu');
colnames(t1) <- c('ko', 'en', 'si', 'ma', 'hi', 'pt');

ko <- t1[,'ko'];
en <- t1[,'en'];
si <- t1[,'si'];
ma <- t1[,'ma'];
hi <- t1[,'hi'];
pt <- t1[,'pt'];

t2 <- data.frame(ko, en, si, ma, hi, pt);

t1 <- rbind(t1, avg=round(colMeans(t1),1));
t1 <- cbind(t1, avg=round(rowMeans(t1),1));
t1 <- cbind(t1, sum=rowSums(t1[,-5]));
print(t1);

#t2 <- rbind(t2, avg=round(colMeans(t2),1));
#t2$avg <- round(rowMeans(t2),1);
#t2$sum <- rowSums(t2[,-5]);

t2 <- rbind(t2, avg=floor(colMeans(t2)*10)/10);
t2$avg <- floor(rowMeans(t2)*10)/10
t2$sum <- rowSums(t2[,-5]);

#floor(colMeans(t2)*10)/10

print(t2)
