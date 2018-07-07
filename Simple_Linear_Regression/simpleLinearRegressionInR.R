# Data Preprocessing 

#Importing the dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]


# Splitting the data into test set and training set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature selection
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

# Fitting the Simple linear regression to the training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)


# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the TRaining set results
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
             colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(
    regressor, newdata = training_set
  )), colour = 'blue')
ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') +
  ylab('Salary')


# Visualising on test set results
- 
