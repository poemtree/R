# 워드클라우드 만들기
# 워드클라우드는 단어의 빈도에 따라 글자의 크기와 색깔이 다르게 표현
# 되는 구름 모양의 표이다..

# 워드클라우드를 이용하기 위해 패키기를 설치하자.. 글자의 색을 바꿀
# RColorBrewer 패키지는 기본으로 내장되어있어 로드만 진행한다.
# install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

# 단어 색상 목록 만들기
# RColorBrewer 패키지의 brewer.pal()함수를 이용하여 단어의 색깔을
# 지정할때 사용할 색상 코드 표를 만든다.

pal <- brewer.pal(10, 'Dark2')

# wordcloud()는 표를 그릴 때마다 난수를 이용해 매번 다른 모양의 표
# 를 만든다. 항상 동일한 워드클라우드가 생성되도록 난수를 고정하자
set.seed(1234)

# 워드클라우드 만들기
# 앞에서 만든 df_word를 이용해 워드클라우드를 만들어보자 
# wordcloud()의 파라미터들은 워드클라우드의 모양을 결정한다.
jpeg(filename = "c:\\rproject\\wc.jpg", width = 740, height=740, quality = 100);
wc <- wordcloud(words = df$word,  # 표현할 단어 
          freq = df$freq,   # 단어의 빈도
          min.freq = 2,          # 최소 단어 빈도
          max.words = 200,       # 최대 표현 단어 수
          random.order = TRUE,  # 고빈도 단어 중앙 배치
          rot.per = .1,          # 회전 단어 비율
          scale = c(4, 0.6),     # 단어 크기 범위
          colors = pal)          # 색상 목록

print(wc)
dev.off()

