exdata <- function() {
  library(readxl);
  data <- read_excel('excel_exam.xlsx');
  is.data.frame(data)
  class(data);
  return(data)
}

exdatafile <- function(fname) {
  library(readxl);
  data <- read_excel(fname, col_names = FALSE);
  is.data.frame(data)
  return(data)
}

exdatamultisheet <- function(fname, snum) {
  library(readxl);
  data <- read_excel(fname, sheet = snum);
  is.data.frame(data)
  return(data)
}

data <- exdata();
mean(data$math);
colnames(data)

