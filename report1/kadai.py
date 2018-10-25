#!/usr/bin/env python
# coding:utf-8
from sklearn import datasets
import matplotlib.pyplot as plt
import sixelplot
import IPython

iris = datasets.load_iris()

def kadai1():
    iris.keys()
    #>> dict_keys(['data', 'target', 'filename', 'feature_names', 'DESCR', 'target_names'])
    iris['data'].dtype
    #dtype('float64')
    iris['data'].shape
    #(150, 4)
    iris['target']
    #array([0, 0, ..., 1, 1, ..., 2, 2, ...])
    iris.feature_names
    #['sepal length (cm)',
    # 'sepal width (cm)',
    # 'petal length (cm)',
    # 'petal width (cm)']

def kadai2():
    pass

def kadai3():
    return [['a', 'b', 'c'][k] for k in iris['target']]

def kadai4():
    X, Y = 4, 4
    fig, ax = plt.subplots(X,Y)
    for x in range(X):
        for y in range(Y):
            x_name = iris.feature_names[x]
            y_name = iris.feature_names[y]
            if x == y:
                pass
                ax[x,y].text(0.1, 0.2, 
                             x_name.replace(' (cm)', '').replace(' ', '\n'),
                             fontsize=20)
            else:
                ax[x,y].scatter(iris['data'][:,x], iris['data'][:,y], marker='.')
    fig.savefig('out.png')
#    sixelplot.show

def kadai5():
    boston = datasets.load_boston()
    boston.feature_names
    #array(['CRIM', 'ZN', 'INDUS', 'CHAS', 'NOX', 'RM', 'AGE', 'DIS', 'RAD',
    #       'TAX', 'PTRATIO', 'B', 'LSTAT'], dtype='<U7')
    print(boston.DESCR) #説明文
    boston.data.shape #(データ件数, 特徴量)


