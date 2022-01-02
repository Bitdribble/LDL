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