#!/usr/bin/env python
# coding:utf-8
import numpy as np
import matplotlib.pyplot as plt
import math

t_A = -1
x_A = np.array([0,0])
t_B = -1
x_B = np.array([1,0])
t_C = -1
x_C = np.array([0,1])
t_D = 1
x_D = np.array([1,1])
w = np.array([-1,-1])
b = 1.5

train_data = list(zip(x_A, x_B, x_C, x_D))
class_label = list(map(str, [t_A, t_B, t_C, t_D]))

def q1():
    plt.clf()
    plt.scatter(*train_data)
    plt.text(0+0.01 , 0+0.01 , '-1')
    plt.text(1+0.01 , 0+0.01 , '-1')
    plt.text(0+0.01 , 1+0.01 , '-1')
    plt.text(1+0.01 , 1+0.01 , '+1')
    plt.show()

def q2():
    plt.clf()
    plt.scatter(*train_data)
    plt.text(0+0.01 , 0+0.01 , '-1')
    plt.text(1+0.01 , 0+0.01 , '-1')
    plt.text(0+0.01 , 1+0.01 , '-1')
    plt.text(1+0.01 , 1+0.01 , '+1')
    plt.plot([0+0    , 1+0  ]  , [1+0    , 0+0  ])
    plt.plot([0+0.25 , 1+0.25] , [1+0.25 , 0+0.25])
    plt.plot([0+0.5  , 1+0.5]  , [1+0.5  , 0+0.5])
    plt.plot([0      , 1.5]    , [1.5    , 0])
    plt.show()

def q3():
    print(math.sqrt(2)/4)

def KKT(t, x):
    w = 2* np.array([1,1])
    b = 2* -1.5
    return t*(w.transpose() @ x + b)

def q5():
    print(KKT(t_B, x_B)>=1)
    print(KKT(t_C, x_C)>=1)
    print(KKT(t_D, x_D)>=1)

def q6():
    x = [x_B, x_C, x_D]
    t = [t_B, t_C, t_D]
    H = [[t[i]*t[j]*x[i].transpose()@x[j] for j in range(3)]for i in range(3)]
    print(str(H).replace('[','{').replace(']','}'))
    print(t)
#    a =  sympy.var("a")

def q7():
    print("マセマティカでやった")

def q8():
    x = [x_B, x_C, x_D]
    t = [t_B, t_C, t_D]
    a = [2,2,4]
    b = -3
    w_0 = sum(a[i]*t[i]*x[i]for i in range(3))
    print(w_0) # [2 2]

def q9():
    #(5)より
    b = -3

def q10():
    print("一致した")

if __name__ == '__main__':
    pass
