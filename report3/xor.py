#!/usr/bin/env python
# coding:utf-8

import numpy as np
import mxnet as mx
import logging

x1 = [0, 0]
x2 = [0, 1]
x3 = [1, 0]
x4 = [1, 1]

x = np.asarray([x1, x2, x3, x4], dtype=np.float32)
y = np.asarray([-1, 1, 1, -1], dtype=np.int32)
batch_size = 4

#logging.basicConfig(level=logging.DEBUG, format='%(asctime)-15s %(message)s')

net = mx.symbol.Variable('data')
net = mx.symbol.FullyConnected(data=net, name='fc1', num_hidden=2)
net = mx.symbol.Activation(data=net, name='sigmoid1', act_type='sigmoid')
net = mx.symbol.FullyConnected(data=net, name='fc2', num_hidden=2)
net = mx.symbol.SoftmaxOutput(data=net, name='softmax')

model = mx.model.FeedForward(
    ctx              = mx.cpu(),
    symbol           = net,
    numpy_batch_size = batch_size,
    num_epoch        = 200,
    learning_rate    = 1,
    momentum         = 0.9,
    initializer      = mx.init.Xavier(factor_type='in')
)

model.fit(
    X                  = x,
    y                  = y,
    eval_data          = (x, y),
    eval_metric        = ['accuracy']
#    epoch_end_callback = mx.callback.do_checkpoint('xor')
)

print(model.predict(x))

