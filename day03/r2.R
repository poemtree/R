library('googleVis')

#    Fruit Year Location Sales Expenses Profit       Date
#1  Apples 2008     West    98       78     20 2008-12-31
#2  Apples 2009     West   111       79     32 2009-12-31
#3  Apples 2010     West    89       76     13 2010-12-31
#4 Oranges 2008     East    96       81     15 2008-12-31
#5 Bananas 2008     East    85       76      9 2008-12-31
#6 Oranges 2009     East    93       80     13 2009-12-31
#7 Bananas 2009     East    94       78     16 2009-12-31
#8 Oranges 2010     East    98       91      7 2010-12-31
#9 Bananas 2010     East    81       71     10 2010-12-31

#1. Fruits 데이터를 기반으로 년도별 월별 Sales 합을 구하시오.
yymmSalesSum <- aggregate(Sales~substr(Date,1,4)+substr(Date,6,7), Fruits, sum)

#2. 1번의 결과를 기반으로 순이익(Psales)컬럼을 추가하시오.
#   순이익 = (Sales - Profit) * 1.83
yymmSalesSum$Psales <- (yymmSalesSum$Sales - aggregate(Profit~substr(Date,1,4)+substr(Date,6,7), Fruits, sum)$Profit) * 1.83
#substr 으로 Data열에 연도와 월을 접근할 수 있다..

#3. 년월 별 세금(Fee)을 계산하여 컬럼을 추가 하시오
#   세금 = (총 판매액(Sales) - 총 수익(Profit)) * 0.1
yymmSalesSum$Fee <- (yymmSalesSum$Sales - aggregate(Profit~substr(Date,1,4)+substr(Date,6,7), Fruits, sum)$Profit) * 0.1
