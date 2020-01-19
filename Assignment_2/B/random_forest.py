from sklearn.preprocessing import RobustScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_validate
import argparse

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import train_test_split
from sklearn.metrics import f1_score, accuracy_score

parser = argparse.ArgumentParser()
parser.add_argument('-f', '--file', help='Name of the file to work on')
options = parser.parse_args()

file_name = options.file

data_ufc_clean = pd.read_csv('../result_data/'+file_name)

# Attribute selection based on correlation matrix
data_ufc_clean = data_ufc_clean[['weight_class',
                                 'R_Height_cms',
                                 'R_Weight_lbs',
                                 'B_Height_cms',
                                 'B_Weight_lbs',
                                 'R_Reach_cms',
                                 'B_Reach_cms']]


X = data_ufc_clean[data_ufc_clean.columns.difference(['weight_class'])]
Y = data_ufc_clean['weight_class']


def test_splits(test_size):
    X_train, X_test, y_train, y_test = train_test_split(X, Y,test_size=test_size, random_state=0)

    classifier_rf = RandomForestClassifier(criterion='gini', max_depth=15, max_features='log2', n_estimators=150)
    scaler = RobustScaler()
    X_train_scaled = pd.DataFrame(scaler.fit_transform(X_train), columns=X_train.columns)
    X_test_scaled = pd.DataFrame(scaler.transform(X_test), columns=X_test.columns)

    classifier_rf.fit(X_train_scaled, y_train)
    y_pred = classifier_rf.predict(X_test_scaled)

    '''np.set_printoptions(precision=2)
    disp = plot_confusion_matrix(classifier_rf, X_test_scaled, y_test,
                                 display_labels=classifier_rf.classes_,
                                 cmap=plt.cm.Blues,
                                 normalize=None)
    disp.ax_.set_title('Confusion matrix')
    plt.xticks(xticks, classifier_svm.classes_, rotation=90)'''
    return f1_score(y_test, y_pred, average='weighted')

test_splits_and_scores = []
for i in np.arange(0.05,1.05,0.10):
    test_splits_and_scores.append([i,test_splits(i)])

test_splits_and_scores_df = pd.DataFrame(test_splits_and_scores, columns=['test_size','score'])

print(test_splits_and_scores_df)
fig, ax = plt.subplots(figsize=(15,5))
ax.set_xticks(test_splits_and_scores_df['test_size'])
plt.scatter(test_splits_and_scores_df['test_size'], test_splits_and_scores_df['score'])
plt.savefig('../result_data/images/'+file_name[:-4]+'.png')
