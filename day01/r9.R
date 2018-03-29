c1 <- c(1:10);
sum <- 0;
for(i in c1) {
  sum <- sum + i; #중요함.. +=이 안된다.
}
print(sum);
print(sum(c1))