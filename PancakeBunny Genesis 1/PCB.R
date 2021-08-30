library(tidyverse)
df<-data.table::fread("pcb1.csv", sep = ";", dec=",",
                      stringsAsFactors = FALSE)
df <- df %>%
  mutate(timestamp = as.Date(timestamp, "%d.%m.%y"))
df$close <- log(as.numeric(df$close))
pcb_plot <- ggplot(df, aes(x=timestamp, y= close, color=token)) + geom_point() + geom_smooth()
print(pcb_plot + labs(y="log($Price)", x = "Time"))

