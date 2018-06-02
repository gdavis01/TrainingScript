#change division syntax
from __future__ import division

#import data manipulation packages
import pandas as pd
import numpy as np
from scipy import stats
import statsmodels.api as sm
import matplotlib.pyplot as plt

#creating a dataframe
d = {'col1': [1, 2], 'col2': [3, 4]}
df = pd.DataFrame(data=d)
df

#reading in data from csv files

sal = pd.read_csv('C:\Users\garri\OneDrive\RScripts\Salaries.csv')
#View head of table (same as head function in R)
sal.head(10)

#Add new column to existing dataframe
sal['gender'] = sal.sex

sal.gender


#recoding (mapping) new features

def recoding_function(x):
    if (x < 95000):
        return ('Part-Time')
    else:
        return ('Full-Time')

sal['Job-Status'] = \
    sal.salary.apply(recoding_function)

sal.head(10)

##introduction to basic statistics

#calculating mean
sal['salary'].mean()

#calculating standard deviation
sal['salary'].std()

#unpaired t.test
stats.ttest_ind(sal['yrssincephd'],sal['yrsservice'])

#paired t.test
stats.ttest_rel(sal['yrssincephd'],sal['yrsservice'])

#welch's or unequal variance t.test

stats.ttest_ind(sal['yrssincephd'],sal['yrsservice'], equal_var=False)

#python scipy libray does not give an option for us to perform one-tailed two sample test


#creating a linear model
from pandas.stats.api import ols

lm = ols(y=sal['yrssincephd'],x=sal['yrsservice'])
lm


#chisquare analysis
from scipy.stats import chi2_contingency


#basic plotting
plt.plot(sal['yrssincephd'],sal['yrsservice'])
