import argparse
import random as rnd
import pandas as pd
import numpy as np
import json
import sys


parser = argparse.ArgumentParser()
parser.add_argument('-t', '--type', choices = ['all', 'spec'], default='all', help='All -> all attributes, Spec -> defined in config.json')
parser.add_argument('-p', '--percent', default=0, help='Percentage of missing values')
parser.add_argument('-r', '--random', default=1, help='Initalization value of random generator')
parser.add_argument('-f', '--file', default='preprocessed_data.csv', help='Name of the file, placed in data folder')
parser.add_argument('-c', '--config', default='config.json', help='Name of the config file')
options = parser.parse_args()

type = options.type
percentage = float(int(options.percent)/100)
random_value = int(options.random)
file_name = options.file
config_file = options.config

if percentage<0 or percentage>1:
  print("Percentage must be between 0 and 100")
  sys.exit(1)

rnd.seed(random_value)
data = pd.read_csv('../source_data/'+file_name)

for column in data:
    col_type = str(data[column].dtype)
    if col_type.startswith('int'):
        data = data.astype({column: 'Int64'})

if type == 'spec':
    config = None
    with open(config_file, 'r') as config_file:
        config = config_file.read()
        config = json.loads(config)
    for column in config['columns']:
        rows = data.shape[0]
        rows_n = round(rows * float(column['percentage']/100))
        rows = rnd.sample(range(0, rows), rows_n)
        for row in rows:
            data.iat[row,column['index']] = np.nan

elif type == 'all':
    rows = data.shape[0]
    cols = data.shape[1]
    cells = rows * cols
    cells_n = round(cells * percentage)
    cells = rnd.sample(range(0, cells), cells_n)
    for cell in cells:
        col = int(cell/rows)
        row = (cell%rows)
        data.iat[row,col] = np.nan

data.to_csv('../result_data/'+file_name[:-4]+'_nulled.csv', sep=',', index=False)
