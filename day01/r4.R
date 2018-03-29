v1 <- c(70,80,90,100);
names(v1) <- c('ko','en','si','ma');
vv <- v1[2:4];
result <- mean(v1[-2:-3]);
print(result)
