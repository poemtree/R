# �� �ð��� �̾� �׷����� �׸��� ����� �����Ѵ�.

# install.packages('plotly')
# install.packages('htmlwidgets')
# devtools::install_github('hadley/ggplot2')

library(ggplot2)
library(plotly)
library(htmlwidgets)
devtools::install_github('hadley/ggplot2')
p <- ggplot(data=mpg, aes(x=displ, y=hwy, col=drv))+geom_point()

pp <- ggplotly(p)
class(pp)
saveWidget(pp,file='mpg2.html')
