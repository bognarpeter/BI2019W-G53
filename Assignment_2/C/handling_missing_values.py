import argparse
import pandas as pd
import statistics
import numpy as np

parser = argparse.ArgumentParser()
#####
# a. ignoring the respective attributes completely in the dataset
# b. replacing the missing attribute values by the mean / median value of that
# attribute in the entire dataset
# c. replacing the missing attribute by the mean / median value of that attribute in
# the respective class
#####
parser.add_argument('-t', '--type', choices = ['a', 'b', 'c'], default='a', help='type of handling [a/b/c]')
parser.add_argument('-f', '--file', help='Name of the file to work on')
parser.add_argument('-y', '--pred', help='Class attribute to split by | only for type C')

options = parser.parse_args()

type = options.type
file_name = options.file
pred_class = options.pred

data = pd.read_csv('../result_data/'+file_name)

if type == 'a':
    data = data.dropna()

elif type == 'b':
    for column in data:
        column_type = str(data[column].dtype)
        if column_type.startswith('float'):
            data[column] = data[column].fillna(data[column].mean())
        elif column_type.startswith('int'):
            data[column] = data[column].fillna(data[column].median())
        else:
            data[column] = data[column].fillna(data[column].mode()[0])

elif type == 'c':

    data[pred_class] = data[pred_class].fillna(data[pred_class].mode()[0])
    pred_class_values = data[pred_class].unique()

    pred_class_substitution = {}
    for pcv in pred_class_values:
        pred_class_substitution[pcv]= data.index[data[pred_class] == pcv].tolist()

    for column in data:
        column_type = str(data[column].dtype)
        for pcv in pred_class_values:
            values = [data.iloc[i][column] for i in pred_class_substitution[pcv] if not pd.isnull(data.iloc[i][column])]
            if column_type.startswith('float'):
                mean = statistics.mean(values)
                for i in pred_class_substitution[pcv]:
                    if pd.isnull(data.iloc[i][column]):
                        data.set_value(i, column, mean)
            elif column_type.startswith('int'):
                median = statistics.median(values)
                for i in pred_class_substitution[pcv]:
                    if pd.isnull(data.iloc[i][column]):
                        data.set_value(i, column, median)
            else:
                mode = max(set(values), key=values.count)
                for i in pred_class_substitution[pcv]:
                    if pd.isnull(data.iloc[i][column]):
                        data.set_value(i, column, mode)


data.to_csv('../result_data/'+file_name[:-4]+'_handled.csv',index=False)
