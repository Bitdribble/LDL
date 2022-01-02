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
...
Epoch 35/128 loss: 0.0540 - acc: 0.9878 - val_loss: 4.8059 - val_acc: 0.6837
Epoch 36/128 loss: 0.0484 - acc: 0.9884 - val_loss: 4.6184 - val_acc: 0.6921
```

### Experiment 4

Add L2 weight decay `1e-5` - still overfitting
```
Epoch 15/128 loss: 0.0747 - acc: 0.9767 - val_loss: 2.3621 - val_acc: 0.6815
Epoch 16/128 loss: 0.0784 - acc: 0.9754 - val_loss: 2.2545 - val_acc: 0.6838
```

Add L2 weight decay `1e-4` - still overfitting
```
Epoch 32/128 loss: 0.0945 - acc: 0.9685 - val_loss: 2.0144 - val_acc: 0.6629
Epoch 33/128 loss: 0.0942 - acc: 0.9692 - val_loss: 2.0850 - val_acc: 0.6707
```

Add L2 weight decay `1e-3`
```
Epoch 6/128 loss: 0.6351 - acc: 0.7768 - val_loss: 0.8329 - val_acc: 0.7095
Epoch 7/128 loss: 0.5773 - acc: 0.7997 - val_loss: 0.8730 - val_acc: 0.7108
Epoch 8/128 loss: 0.5352 - acc: 0.8133 - val_loss: 0.8649 - val_acc: 0.7112
Epoch 9/128 loss: 0.4935 - acc: 0.8269 - val_loss: 0.8843 - val_acc: 0.7149
Epoch 23/128 loss: 0.2850 - acc: 0.9006 - val_loss: 1.1244 - val_acc: 0.7007
Epoch 24/128 loss: 0.2770 - acc: 0.9029 - val_loss: 1.0324 - val_acc: 0.7118
```

Add L2 weight decay `1e-2` - too much. Best L2 weight decay is `1e-3`.
```
Epoch 6/128 loss: 1.0240 - acc: 0.6411 - val_loss: 1.0313 - val_acc: 0.6299
Epoch 7/128 loss: 1.0029 - acc: 0.6486 - val_loss: 1.0089 - val_acc: 0.6446
Epoch 117/128 loss: 0.9004 - acc: 0.6891 - val_loss: 0.9161 - val_acc: 0.6866
Epoch 118/128 loss: 0.8976 - acc: 0.6894 - val_loss: 0.9510 - val_acc: 0.6744
```

### Experiment 5

No L2 loss, dropout of `0.1`.

```
----------------------------------------------------------------
        Layer (type)               Output Shape         Param #
================================================================
            Conv2d-1           [-1, 64, 32, 32]           1,792
              ReLU-2           [-1, 64, 32, 32]               0
         MaxPool2d-3           [-1, 64, 16, 16]               0
           Dropout-4           [-1, 64, 16, 16]               0
            Conv2d-5           [-1, 64, 16, 16]          36,928
              ReLU-6           [-1, 64, 16, 16]               0
         MaxPool2d-7             [-1, 64, 8, 8]               0
           Dropout-8             [-1, 64, 8, 8]               0
           Flatten-9                 [-1, 4096]               0
           Linear-10                 [-1, 1024]       4,195,328
             ReLU-11                 [-1, 1024]               0
          Dropout-12                 [-1, 1024]               0
           Linear-13                   [-1, 10]          10,250
================================================================
Total params: 4,244,298
Trainable params: 4,244,298
Non-trainable params: 0
----------------------------------------------------------------
Input size (MB): 0.01
Forward/backward pass size (MB): 1.62
Params size (MB): 16.19
Estimated Total Size (MB): 17.82
----------------------------------------------------------------
None

Epoch 4/128 loss: 0.6559 - acc: 0.7692 - val_loss: 0.8792 - val_acc: 0.7051
Epoch 5/128 loss: 0.4967 - acc: 0.8238 - val_loss: 0.9092 - val_acc: 0.7125
Epoch 17/128 loss: 0.1146 - acc: 0.9654 - val_loss: 1.7004 - val_acc: 0.7104
Epoch 18/128 loss: 0.1057 - acc: 0.9676 - val_loss: 1.8482 - val_acc: 0.7115
```

Dropout of `0.2`.

```
Epoch 4/128 loss: 0.7960 - acc: 0.7221 - val_loss: 0.8531 - val_acc: 0.7034
Epoch 5/128 loss: 0.6733 - acc: 0.7649 - val_loss: 0.8295 - val_acc: 0.7192
Epoch 12/128 loss: 0.2467 - acc: 0.9175 - val_loss: 1.0500 - val_acc: 0.7359
Epoch 13/128 loss: 0.2193 - acc: 0.9277 - val_loss: 1.1191 - val_acc: 0.7307
```

Dropout of `0.3`

```
Epoch 10/128 loss: 0.5336 - acc: 0.8152 - val_loss: 0.7749 - val_acc: 0.7418
Epoch 11/128 loss: 0.4811 - acc: 0.8330 - val_loss: 0.7913 - val_acc: 0.7407
Epoch 64/128 loss: 0.2042 - acc: 0.9437 - val_loss: 1.2742 - val_acc: 0.7449
Epoch 65/128 loss: 0.1929 - acc: 0.9476 - val_loss: 1.5079 - val_acc: 0.7469
```

Dropout of `0.4`

```
Epoch 5/128 loss: 0.9595 - acc: 0.6638 - val_loss: 0.8867 - val_acc: 0.7014
Epoch 6/128 loss: 0.8859 - acc: 0.6886 - val_loss: 0.8367 - val_acc: 0.7070
Epoch 10/128 loss: 0.7226 - acc: 0.7514 - val_loss: 0.7811 - val_acc: 0.7344
Epoch 11/128 loss: 0.6888 - acc: 0.7618 - val_loss: 0.7507 - val_acc: 0.7444
Epoch 20/128 loss: 0.5205 - acc: 0.8234 - val_loss: 0.7461 - val_acc: 0.7520
Epoch 21/128 loss: 0.5144 - acc: 0.8263 - val_loss: 0.7415 - val_acc: 0.7543
Epoch 41/128 loss: 0.3789 - acc: 0.8787 - val_loss: 0.8186 - val_acc: 0.7577
Epoch 42/128 loss: 0.3791 - acc: 0.8765 - val_loss: 0.8730 - val_acc: 0.7632
Epoch 43/128 loss: 0.3824 - acc: 0.8790 - val_loss: 0.8162 - val_acc: 0.7573
Epoch 70/128 loss: 0.3386 - acc: 0.8971 - val_loss: 0.9054 - val_acc: 0.7645
Epoch 71/128 loss: 0.3382 - acc: 0.8987 - val_loss: 0.8515 - val_acc: 0.7554
Epoch 72/128 loss: 0.3325 - acc: 0.8996 - val_loss: 0.8278 - val_acc: 0.7611
Epoch 73/128 loss: 0.3313 - acc: 0.8995 - val_loss: 0.8371 - val_acc: 0.7574
```

Dropout of `0.5` is worst than `0.4`.

```
Epoch 5/128 loss: 1.0947 - acc: 0.6157 - val_loss: 0.9741 - val_acc: 0.6735
Epoch 6/128 loss: 1.0424 - acc: 0.6361 - val_loss: 0.9183 - val_acc: 0.6936
Epoch 21/128 loss: 0.7904 - acc: 0.7289 - val_loss: 0.7507 - val_acc: 0.7515
Epoch 22/128 loss: 0.7769 - acc: 0.7343 - val_loss: 0.7422 - val_acc: 0.7503
```