library(dplyr)
exam <- read.csv('csv_exam.csv')

# mutate() -- 컬럼을 추가한다. 데이터프레임 명을 반복 입력하지 않아 코드가 간결하다.
# 어쨌든 삽입을 하기 위해 대입연산자를 사용하는 것은 변함 없다.

# 컬럼 추가
exam %>% mutate(total = math + english + science)

# 삽입을 할 경우..
ex1 <- exam %>% mutate(total = math + english + science)

# 여러 컬럼을 추가
exam %>% mutate(total = math + english + science, mean = (math + english + science)/3 )

# 미리 만들어진 컬럼을 사용하여 연산이 가능하다.. 위처럼 구현하지 말자..
exam %>% mutate(total = math + english + science, mean = total/3)

# mutate()와 ifelse() 사용 -- 조건에 따라 다른 값을 부여한 변수를 추가할 수 있다
exam %>% mutate(test = ifelse(science > 60, 'pass', 'fail'))

# 다중 ifelse()문 사용
ex1 %>% mutate(grade = ifelse(total >= 270, 'A', ifelse(total >= 240, 'B', ifelse(total >= 210, 'C', ifelse(total >= 180, 'D', 'F')))))

# arrange()를 사용하여 정렬하기 -- 내림차순
exam %>% mutate(total = math + english + science) %>% arrange(desc(total))


# mpg 데이터를 이용해 분석 문제를 해결하시오.
# 1. mpg 복사본을 만들고, cty와 hwy를 더한 '합산 연비' 컬럼을 추가하시오.
mympg <- mpg %>% mutate(tot = cty + hwy)

# 2. 1번에서 만든 '합산 연비' 컬럼을 2로 나눠 '평균 연비' 컬럼을 추가하시오.
mympg <- mympg %>% mutate(avg = tot/2)

# 3. '평균 연비' 컬럼이 가장 높은 자동차 3종의 데이터를 출력하시오.
mympg %>% arrange(desc(avg)) %>% head(3)


# 4. 1~3번 문제를 해결할 수 있는 하나로 된 dplyr 구문을 만들어 실행하시오.
# 데이터는 mpg 원본을 사용하여 출
mpg %>% mutate(tot = cty+hwy, avg = tot/2) %>% arrange(desc(avg)) %>% head(3)

