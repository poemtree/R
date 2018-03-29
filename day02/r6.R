library(readxl);
getcsv <- function(fname, h) {
  data <- read.csv(fname, header = h, stringsAsFactors = FALSE, encoding = 'UTF-8')
  return(data)
}

data <- getcsv('csv_exam_3.csv', FALSE)
d1$avg <- round(rowMeans(data[,c(4:6)]),2)

class(data$V1)
data

writedata <- function(df,fname){
  write.csv(df, file=fname) 
}


