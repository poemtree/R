# install.packages('googleVis')
# aggregate.. SQL의 GROUP BY와 유사하다!!

library('googleVis')
class(Fruits)
print(Fruits)
bananas <- Fruits[Fruits$Fruit=='Bananas',]
sum(bananas$Sales)

# Fruuts 데이터 프레임의 Sales를 Fruit로 묶어 sum 한다.
df1 <- aggregate(Sales~Fruit,Fruits,sum)

df2 <- aggregate(Profit~Year,Fruits,sum)

# 다중 조건 그루핑도 가능하다.
df3 <- aggregate(Profit~Fruit+Year,Fruits,sum)

# apply.. http://issactoast.com/53
# apply()는 데이터 프레임의 각 컬럼또는 로우에 특정 연산을 수행한다.

df4 <- Fruits[,c(4:6)]

# 2은 컬럼이다
apply(df4,2,sum)

apply(df4,2,mean)

apply(df4,2,max)

apply(df4,2,min)

# 1은 로우이다..
apply(df4,1,sum)