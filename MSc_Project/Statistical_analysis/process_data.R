library(ggplot2)
library(dplyr)



req_df <- function(df, rows){
  df<- df[rows,]
  return (df)
}


clean_df <- function(df){
  
 
  colnames(df) <- df[1,]
  df <- df[-1, ] 
  colnames(df)[1]<- 'conc'
  df <- data.frame(df, check.names = FALSE)
  names(df) <- gsub(" ", "", names(df))
  df[, 2:ncol(df)]<-  lapply(df[, 2:ncol(df)], as.numeric)
  return (df)
}


# load swim speed dilutions 
rows = c(2,3,4,5,6)
df_s <- req_df(data_file,rows )

df_s<-clean_df(df_s)


# load motility dilutions 
rows = c(8,9,10,11,12)
df_m <- req_df(data_file,rows )


df_m<-clean_df(df_m)


df_melted_s = melt(df_s, id.vars = 'conc')

df_melted_m = melt(df_m, id.vars = 'conc')


colnames(df_melted_s)[1]<- 'bacteria_concentration'
colnames(df_melted_s)[2]<- 'time_in_minutes'
colnames(df_melted_s)[3]<- 'swim_speed'



colnames(df_melted_m)[1]<- 'bacteria_concentration'
colnames(df_melted_m)[2]<- 'time_in_minutes'
colnames(df_melted_m)[3]<- 'motility'



ggplot(df_melted_s, aes(x = time_in_minutes, y = swim_speed)) + geom_line(aes(color =bacteria_concentration , group = bacteria_concentration)) +
 geom_point() +labs(title="Bacteria swim speed")+theme(plot.title = element_text(hjust=0.5))


ggplot(df_melted_m, aes(x = time_in_minutes, y = motility)) + geom_line(aes(color =bacteria_concentration , group = bacteria_concentration)) +
  geom_point() +labs(title="Bacteria motility")+theme(plot.title = element_text(hjust=0.5))




# show box plot


ready_for_box <- function(df){
  rownames(df) <- df$conc
  df$conc <- NULL
  df <-data.frame(t(df), check.names = FALSE)
  return (df)
}

df_m <- ready_for_box(df_m)
df_s <- ready_for_box(df_s)

ggplot(stack(df_s), aes(x = ind, y = values)) +
  labs(x="Samples", y="swim speed") +
  geom_boxplot(fill = "white", colour = "#3366FF")


ggplot(stack(df_m), aes(x = ind, y = values)) +
  labs(x="Samples", y="motility") +
  geom_boxplot(fill = "white", colour = "#3366FF")


# strength of correlation between motility and swim speed

df2 <- cbind(df_s[,4], df_m[,4]) 
df2<- data.frame(df2)


colnames(df2)[1] <- 'x'
colnames(df2)[2] <- 'y' 

   
ggplot(df2, aes(x=x, y=y)) +
  geom_point()



ggplot(df2, aes(x = x, y = y)) +
  geom_point(aes(color = factor(x))) +
  stat_smooth(method = "lm",
              col = "#C42126", se = FALSE, linewidth = 1
  )



# significance testing
 

t.test(df_s[1,], df_s[4,], var.equal = TRUE)


























