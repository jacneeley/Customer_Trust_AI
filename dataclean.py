# -*- coding: utf-8 -*-
"""
Created on Wed Nov 22 16:20:21 2023

@author: 3ak
"""
import pandas as pd


path = "C:/Users/Owner/Documents/Python-Scripts/mkt_research/Phase2_mkt_research/customer_retention.csv"

df = pd.read_csv(path, sep=',')

#drops
final_cols = ['ResponseId','Q1','Q2','Q3','Q4','Q5','Q6','Q7','Q8','Q9','Q10','Q11','Q12']

#create a new df using the columns in list 'final_cols'.
df = df[df.columns.intersection(final_cols)]

df.drop([1],inplace=True)
df.dropna(inplace=True)

#clean
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
sum_rows = df.iloc[:,5:].sum(axis=1)
sum_rows[0] = 'Score'
df['AI Trust Score'] = sum_rows

export_csv = df.to_csv(r'Customer_Trust_In_AI.csv',index=None,header=True,sep=',')