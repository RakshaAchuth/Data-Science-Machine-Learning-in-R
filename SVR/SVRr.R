#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


#encoding categorical data
# dataset$State= factor(dataset$State,
#                       levels = c('New York', 'California', 'Florida'),
#                       labels = c(1, 2, 3))

# Splitting the data into test set and training set
#install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Profit, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)


# Fitting SVR into the Dataset
#create our Regressor here
#install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ ., 
                data = dataset,
                type = 'eps-regression')

# Predicting a new result with Regression
y_pred  = predict(regressor, data.frame(Level = 6.5))


# Visualising the Regression Modelresults
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') + 
  xlab('Level') + ylab('Salary')

# For smoother plot(for high resolution)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') + 
  xlab('Level') + ylab('Salary')


