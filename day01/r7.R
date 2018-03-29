name <- c('lee', 'kim', 'park', 'jang', 'hong');
age <- seq(10, 50, 10);
weight <- seq(40, 80, 10);
df <- data.frame(name, age, weight);
dim(df);
nrow(df);
ncol(df);
df2 <- df[2,];
mean(df[,2]);
v1 <- colMeans(df[,c('age','weight')]);
print(v1);
mean(df$age[1:3]);
max(df$age[1:3]);

#median(df$age);
mean(df$age[c(-which(df$age==min(df$age)), -which(df$age==max(df$age)))]);
df$height <- c(180, 170, 160, 150, 155);
df$bmi <- df$weight/(df$height^2)*10000

df[df$weight >= 50, ]
df[which(df$height==max(df[df$weight >= 50, ]$height)), ]
df[which(df$height==max(df[df$weight >= 50 & df$weight <= 60, ]$height)), ]


