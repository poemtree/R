# 한글 자연어 분석 패키지인 KoNLP(Korean Natural Language Processing)
# 을 이용하여 한글 데이터로 형태소 분석을 할 수 있다.
# KoNLP는 자바가 설치되어 있어야 사용할 수 있다, 설치 후 시스템의
# 환경변수 설정까지 완료하자..
# KoNLP를 사용하기 위해 rJava, memoise, stringr 패키지도 함께
# 설치한다.. stringr은 문자처리 패키지로 특수문자 처리에 이용한다.
# install.packages("rJava")
# install.packages("memoise")
# install.packages("KoNLP")
# install.packages("stringr")

library(KoNLP)
library(dplyr)

# KoNLP에서 지원하는 NIA 사전을 메모리로 로드하는 함수이다..
useNIADic()

# 데이터 불러오기
txt <- readLines("hiphop.txt")

head(txt)

# 특수문자를 모두 빈칸으로 바꾸기
library(stringr)
txt <- str_replace_all(txt, '\\W', ' ')
# 위 함수에서 사용된 "\\W"기호는 특수문자를 의미하는 '정규 표현식'
# 이다. 정규표현식을 이용하여 문장 내의 이메일 주소, 전화 번호 등
# 특정한 규칙으로 되어 있는 부분을 추출할 수 있다.
# 정규 표현식에 대해서는 더 자세히 공부해두자..
# '\\W'는 특수문자 '\\w'는 모든 문자이니 조심해서 사용하자

# gsub() 함수를 이용해서도 제거가 가능하다.. replace_all과 인자
# 의 순서가 상이하니 이에 유의하자
# 영어 소문자 대문자 제거하기
txt <- gsub('[A-Z]', '', txt)
txt <- gsub('[a-z]', '', txt)

# 가장 많이 사용된 단어를 알아보자
# 우선 가사에서 명사를 추출해보자..
# KoNLP의 extractNoun()을 이용하면 문장에서 명사만 추출할 수 있다.
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다.")


# 가사에서 명사 추출하기
nouns <- extractNoun(txt)

# 추출한 명사 list를 문자열 백터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# 변수명 수정
df_word <- rename(df_word, word=Var1, freq = Freq)

# 두 글자 이상 단어 추출
df <- filter(df_word, nchar(word) >= 2)
head(df)
