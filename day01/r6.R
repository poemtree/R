# r6.R
#       ko  en  si  ma
# kim   80  90  70  100
# lee   80  99  78  72
# hong  90  78  82  78
# jang  99  89  78  90
#
# 위와 같은 데이터의 행렬을 만들고
# 학생 별 평균 : vector로 만드시오
# 과목 별 평균 : vector로 만드시오

t1 <- matrix(c(80, 90, 70, 100, 80, 99, 78, 72, 90, 78, 82, 78, 99, 89, 78, 90), 4, 4, TRUE);
rownames(t1) <- c('kim', 'lee', 'hong', 'jang');
colnames(t1) <- c('ko', 'en', 'si', 'ma');
kim <- sum(t1['kim',]) / length(t1['kim',]);
lee <- sum(t1['lee',]) / length(t1['lee',]);
hong <- sum(t1['hong',]) / length(t1['hong',]);
jang <- sum(t1['jang',]) / length(t1['jang',]);

rowAvg <- c(kim, lee, hong, jang);

ko <- sum(t1[,'ko']) / length(t1[,'ko']);
en <- sum(t1[,'en']) / length(t1[,'en']);
si <- sum(t1[,'si']) / length(t1[,'si']);
ma <- sum(t1[,'ma']) / length(t1[,'ma']);

colAvg <- c(ko, en, si, ma);

print(rowAvg);
print(colAvg)