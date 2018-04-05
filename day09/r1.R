# R과 Java연동하기..
# 우선 필요한 패키지를 설치하자..
# install.packages('Rserve')

# 이제 콘솔에 Rserve::Rserve()를 입력하면 서버 데몬이 돌아간다..

r1 <- function(a,b){
  v1 <- a*100 + b*0.34;
  return(v1);
}

r2 <- function(){
  v2 <- c(1:20);
  return(v2);
}

r3 <- function(){
  time <- c('6h','7h','8h','9h','10h');
  line2 <- seq(1000, 5000, 1000);
  line3 <- seq(2000, 6000, 1000);
  line4 <- seq(3000, 7000, 1000);
  v3 <- data.frame(time, line2, line3, line4);
}