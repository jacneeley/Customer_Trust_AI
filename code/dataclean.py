# -*- coding: utf-8 -*-
"""
Created on Wed Nov 22 16:20:21 2023

@author: Jacob Neeley
"""
import pandas as pd


path = "./some_path/customer_retention.csv"

df = pd.read_csv(path, sep=',')


#create a new df using the columns in list 'final_cols'.
final_cols = ['ResponseId','Q1','Q2','Q3','Q4','Q5','Q6','Q7','Q8','Q9','Q10','Q11','Q12','Q13_1']
df = df[df.columns.intersection(final_cols)]


#re-order columns
df.rename(columns={'Q13_1':'Q13'},inplace=True)
cols = df.columns.tolist()
cols = cols[:5] + [cols[13]] + cols[5:13]
df['Q13'][0] = 'How much did you spend on our products in the last 3 months?'
df = df[cols]


#drops
df.drop([0,1],inplace=True)
df.dropna(inplace=True)

#clean
df['Q13'] = pd.to_numeric(df['Q13'])

likert_to_numeric = {'Strongly Disagree':1,
          'Somewhat disagree':2,
          'Neither agree nor disagree':3,
          'Somewhat agree':4,
          'Strongly agree':5}

cols = df.columns[df.dtypes == 'object']
df[cols] = df[cols].replace(likert_to_numeric)

#create a row to hold "AI Trust" score
## AI Trust = Sum of row integers
## AI Trust score of 40 = 100% trust in AI = perfect score.
## AI Trust score of 0 = 0% trust in AI.
sum_rows = df.iloc[:,6:].sum(axis=1)
sum_rows[0] = 'Score'
df['AI Trust Score'] = sum_rows
df['AI Trust Score'] = pd.to_numeric(df['AI Trust Score'])

export_csv = df.to_csv(r'Customer_Trust_In_AI.csv',index=None,header=True,sep=',')
