install.packages("tidyverse")
library(tidyverse)
renv::snapshot()
data(iris)

##Explore the dataset
str(iris)
head(iris)
summary(iris)

data(iris)
iris <- as_tibble(iris)
iris
print(iris, n = 3, width = Inf)
summary(iris)
iris %>% summarize_if(is.numeric, mean)

##Explore data quality
install.packages("GGally")
library(GGally)
ggpairs(iris, aes(color = Species))

clean.data <- iris %>% drop_na() %>% unique()
summary(clean.data)

##Kernel Density Estimate
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_density_2d_filled() +
  geom_jitter()


##Correlation Matrix
install.packages("ggcorrplot")
library(ggcorrplot)
cm1 <- iris %>% select(-Species) %>% as.matrix %>% cor()
cm1
ggcorrplot(cm1)


##Data matric visualisation
library(seriation)
iris_matrix <- iris %>% select(-Species) %>% as.matrix()
ggpimage(iris_matrix, prop = FALSE)

iris_long <- as_tibble(iris_matrix) %>% mutate(id = row_number()) %>% pivot_longer(1:4)
head(iris_long)
ggplot(iris_long,
       aes(x = name, y = id, fill = value)) + geom_tile()
