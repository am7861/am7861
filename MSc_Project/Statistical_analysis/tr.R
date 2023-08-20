library(reshape2)
library(ggplot2)

ggplot(stack(df_s), aes(x = ind, y = values)) +
  labs(x="Samples", y="swim speed") +
  geom_boxplot(fill = "white", colour = "#3366FF")



# Box plot (bp)
bxp <- ggboxplot(df_s, x = "dose", y = "len",
                 color = "dose", palette = "jco")
bxp
# Dot plot (dp)
dp <- ggdotplot(df_s, x = "dose", y = "len",
                color = "dose", palette = "jco", binwidth = 1)
dp