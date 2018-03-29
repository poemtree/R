v1 <- c(70,80,90,100);
result <- c(70,80) %in% v1;
print(result);
v2 <- matrix(c(1:100),10,10, byrow=TRUE,);
colnames(v2) <- c('c1','c2','c3','c4','c5','c6','c7','c8','c9','c10');
rownames(v2) <- c('r1','r2','r3','r4','r5','r6','r7','r8','r9','10');
print(v2);

v3 <- matrix(c(1:10),1,10);
v4 <- matrix(c(1:10),10,1)