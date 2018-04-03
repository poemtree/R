library(KoNLP)
library(dplyr)
library(stringr)
library(wordcloud)
library(RColorBrewer)
library(ggplot2)

useNIADic();

txt1 <-readLines('text1.txt');

txt2 <-readLines('text2.txt');

txt3 <-readLines('text3.txt');

txt <- c(txt1, txt2, txt3);

txt <- str_replace_all(txt, '\\W', ' ');
txt <- str_replace_all(txt, '_', '');
txt <- str_replace_all(txt, '_', '');
txt <- str_replace_all(txt, ' ', ' ');
txt <- str_replace_all(txt, '[a-z]', '');
txt <- str_replace_all(txt, '[A-Z]', '');
txt <- str_replace_all(txt, '[0-9]', '');

nouns <- extractNoun(txt);

wordcount <- table(unlist(nouns));

df_word <- as.data.frame(wordcount, stringsAsFactors = FALSE);

df_word <- rename(df_word, word=Var1, freq = Freq);

df_word <- filter(df_word, nchar(word) >= 2);

top20 <- df_word %>% arrange(desc(freq)) %>% head(20);

pal <- brewer.pal(10, 'BrBG');

set.seed(1234);

# wc 함수를 만든다.
# wc(1)을 실행하면 wordcloud 실행, wc(2)를 실행하면 ggplot 실행
# 후 모두 이미지로 저장한다. 이미지 명은 각각 wc.jpg wcbar.jpg


wc <- function(flag) {
  if(flag==1) {
    fc <- function(){ 
      wordcloud(words = df_word$word,
                freq = df_word$freq,
                min.freq = 2,
                max.words = 200,
                random.order = TRUE,
                rot.per = .1,
                scale = c(4, 0.6),
                colors = pal)
    }
    fname <- 'wc'
    dev.off()
  } else {
    order <- arrange(top20, freq)$word
    fc <- function() {
      ggplot(data=top20, aes(x=word,y=freq)) + ylim(0,100) + geom_col() + coord_flip() + scale_x_discrete(limit = order) + geom_text(aes(label=freq), hjust = -0.3)
    }
    fname <- 'wcbar'
  }
  jpeg(filename = paste0('c:\\rproject\\',fname,'.jpg'), width = 740, height=740, quality = 100);
  chart <- fc()
  print(chart)
  dev.off();
}