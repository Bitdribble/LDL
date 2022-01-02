# Experiments with [c7e2_convnet_cifar.ipynb](c7e2_convnet_cifar.ipynb)

### Experiment 1

```
----------------------------------------------------------------
        Layer (type)               Output Shape         Param #
================================================================
            Conv2d-1           [-1, 16, 32, 32]             448
              Tanh-2           [-1, 16, 32, 32]               0
         MaxPool2d-3           [-1, 16, 16, 16]               0
            Conv2d-4            [-1, 8, 16, 16]           1,160
              Tanh-5            [-1, 8, 16, 16]               0
         MaxPool2d-6              [-1, 8, 8, 8]               0
           Flatten-7                  [-1, 512]               0
            Linear-8                  [-1, 128]          65,664
              Tanh-9                  [-1, 128]               0
           Linear-10                   [-1, 10]           1,290
================================================================
Total params: 68,562
Trainable params: 68,562
Non-trainable params: 0
----------------------------------------------------------------
Input size (MB): 0.01
Forward/backward pass size (MB): 0.32
Params size (MB): 0.26
Estimated Total Size (MB): 0.60
----------------------------------------------------------------

Epoch 23/128 loss: 0.2615 - acc: 0.9141 - val_loss: 1.5378 - val_acc: 0.6158
Epoch 24/128 loss: 0.2459 - acc: 0.9193 - val_loss: 1.5945 - val_acc: 0.6204
Epoch 25/128 loss: 0.2377 - acc: 0.9218 - val_loss: 1.6303 - val_acc: 0.6121
```

### Experiment 2

Use ReLU activation instead of Tanh.

```
----------------------------------------------------------------
        Layer (type)               Output Shape         Param #
================================================================
            Conv2d-1           [-1, 16, 32, 32]             448
              ReLU-2           [-1, 16, 32, 32]               0
         MaxPool2d-3           [-1, 16, 16, 16]               0
            Conv2d-4            [-1, 8, 16, 16]           1,160
              ReLU-5            [-1, 8, 16, 16]               0
         MaxPool2d-6              [-1, 8, 8, 8]               0
           Flatten-7                  [-1, 512]               0
            Linear-8                  [-1, 128]          65,664
              ReLU-9                  [-1, 128]               0
           Linear-10                   [-1, 10]           1,290
================================================================
Total params: 68,562
Trainable params: 68,562
Non-trainable params: 0
----------------------------------------------------------------
Input size (MB): 0.01
Forward/backward pass size (MB): 0.32
Params size (MB): 0.26
Estimated Total Size (MB): 0.60
----------------------------------------------------------------
None

Epoch 23/128 loss: 0.2905 - acc: 0.8962 - val_loss: 1.8598 - val_acc: 0.6230
Epoch 24/128 loss: 0.2756 - acc: 0.9012 - val_loss: 1.9746 - val_acc: 0.6296
Epoch 25/128 loss: 0.2644 - acc: 0.9036 - val_loss: 1.9629 - val_acc: 0.6312
Epoch 26/128 loss: 0.2492 - acc: 0.9107 - val_loss: 2.1211 - val_acc: 0.6243
Epoch 27/128 loss: 0.2396 - acc: 0.9143 - val_loss: 2.1689 - val_acc: 0.6238
Epoch 28/128 loss: 0.2259 - acc: 0.9183 - val_loss: 2.3155 - val_acc: 0.6176
Epoch 29/128 loss: 0.2236 - acc: 0.9203 - val_loss: 2.2858 - val_acc: 0.6172
```

### Experiment 3

Widen the number of channels in the conv layers

```
----------------------------------------------------------------
        Layer (type)               Output Shape         Param #
================================================================
            Conv2d-1           [-1, 64, 32, 32]           1,792
              ReLU-2           [-1, 64, 32, 32]               0
         MaxPool2d-3           [-1, 64, 16, 16]               0
            Conv2d-4           [-1, 64, 16, 16]          36,928
              ReLU-5           [-1, 64, 16, 16]               0
         MaxPool2d-6             [-1, 64, 8, 8]               0
           Flatten-7                 [-1, 4096]               0
            Linear-8                 [-1, 1024]       4,195,328
              ReLU-9                 [-1, 1024]               0
           Linear-10                   [-1, 10]          10,250
================================================================
Total params: 4,244,298
Trainable params: 4,244,298
Non-trainable params: 0
----------------------------------------------------------------
Input size (MB): 0.01
Forward/backward pass size (MB): 1.45
Params size (MB): 16.19
Estimated Total Size (MB): 17.66
----------------------------------------------------------------
None

Epoch 4/128 loss: 0.5982 - acc: 0.7908 - val_loss: 0.9434 - val_acc: 0.6918
Epoch 5/128 loss: 0.3960 - acc: 0.8631 - val_loss: 1.0731 - val_acc: 0.6903

```