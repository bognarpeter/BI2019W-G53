import argparse
import random as rnd
import pandas as pd
import json
import sys


parser = argparse.ArgumentParser()
parser.add_argument('-t', '--type', choices = ['all', 'spec'], default='all', help='All -> all attributes, Spec -> defined in config.json')
parser.add_argument('-p', '--percent', default=0, help='Percentage of missing values')
parser.add_argument('-r', '--random', default=1, help='Initalization value of random generator')
parser.add_argument('-f', '--file', default='preprocessed_data.csv', help='Name of the file, placed in data folder')
options = parser.parse_args()

type = options.type
percentage = float(int(options.percent)/100)
random_value = int(options.random)
file_name = options.file

if percentage<0 or percentage>1:
  print("Percentage must be between 0 and 100")
  sys.exit(1)

rnd.seed(random_value)
data = pd.read_csv('../data/'+file_name)

if type == 'spec':
    with open('config.json', 'r') as config_file:
        config = config_file.read()
        config = json.loads(config)

elif type == 'all':
    rows = data.shape[0]
    cols = data.shape[1]
    cells = rows * cols
    cells_n = round(cells * percentage)
    cells = rnd.sample(range(0, cells), cells_n)
    print(cells)
    print(data[1][2:4])

#print(data.head())
