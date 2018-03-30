# install.packages(sqldf)

library(ggplot2)
library(sqldf)

mympg <- sqldf('SELECT *, (cty+hwy)/2 AS tot FROM mpg')

mympg <- cbind(mympg, sqldf('SELECT CASE WHEN tot >= 20 THEN "pass" ELSE "fail" END AS test FROM mympg'))
