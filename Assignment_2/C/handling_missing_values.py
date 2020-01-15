import argparse
import pandas as pd

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
options = parser.parse_args()

type = options.type
file_name = options.file

data = pd.read_csv('../result_data/'+file_name)

print(data.dtypes)

if type == 'a':
    data = data.dropna()
elif type == 'b':
    data = data.fillna(data.mean())
elif type == 'c':
    ## TODO:
    print('todo')

data.to_csv('../result_data/'+file_name[:-3]+'_handled.csv',index=False)
