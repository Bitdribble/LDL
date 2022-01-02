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

Dropout of `0.5` is about the same.

```
Epoch 5/128 loss: 1.0947 - acc: 0.6157 - val_loss: 0.9741 - val_acc: 0.6735
Epoch 6/128 loss: 1.0424 - acc: 0.6361 - val_loss: 0.9183 - val_acc: 0.6936
Epoch 28/128 loss: 0.7342 - acc: 0.7534 - val_loss: 0.7235 - val_acc: 0.7646
Epoch 29/128 loss: 0.7352 - acc: 0.7504 - val_loss: 0.7537 - val_acc: 0.7551
Epoch 30/128 loss: 0.7248 - acc: 0.7536 - val_loss: 0.7462 - val_acc: 0.7577
Epoch 31/128 loss: 0.7264 - acc: 0.7557 - val_loss: 0.7299 - val_acc: 0.7610
Epoch 32/128 loss: 0.7289 - acc: 0.7571 - val_loss: 0.7199 - val_acc: 0.7584
```

#### Experiment 6

Keep dropout `0.4`. Add another conv layer.

```
----------------------------------------------------------------
        Layer (type)               Output Shape         Param #
================================================================
            Conv2d-1           [-1, 64, 32, 32]           1,792
              ReLU-2           [-1, 64, 32, 32]               0
           Dropout-3           [-1, 64, 32, 32]               0
            Conv2d-4           [-1, 64, 32, 32]          36,928
              ReLU-5           [-1, 64, 32, 32]               0
         MaxPool2d-6           [-1, 64, 16, 16]               0
           Dropout-7           [-1, 64, 16, 16]               0
            Conv2d-8           [-1, 64, 16, 16]          36,928
              ReLU-9           [-1, 64, 16, 16]               0
        MaxPool2d-10             [-1, 64, 8, 8]               0
          Dropout-11             [-1, 64, 8, 8]               0
          Flatten-12                 [-1, 4096]               0
           Linear-13                 [-1, 1024]       4,195,328
             ReLU-14                 [-1, 1024]               0
          Dropout-15                 [-1, 1024]               0
           Linear-16                   [-1, 10]          10,250
================================================================
Total params: 4,281,226
Trainable params: 4,281,226
Non-trainable params: 0
----------------------------------------------------------------
Input size (MB): 0.01
Forward/backward pass size (MB): 3.12
Params size (MB): 16.33
Estimated Total Size (MB): 19.46
----------------------------------------------------------------
None

Epoch 11/128 loss: 0.7547 - acc: 0.7375 - val_loss: 0.7239 - val_acc: 0.7482
Epoch 12/128 loss: 0.7340 - acc: 0.7460 - val_loss: 0.7398 - val_acc: 0.7481
Epoch 24/128 loss: 0.6131 - acc: 0.7894 - val_loss: 0.6784 - val_acc: 0.7721
Epoch 25/128 loss: 0.6105 - acc: 0.7941 - val_loss: 0.7186 - val_acc: 0.7629
Epoch 26/128 loss: 0.6073 - acc: 0.7950 - val_loss: 0.6770 - val_acc: 0.7713
Epoch 27/128 loss: 0.5935 - acc: 0.7985 - val_loss: 0.6781 - val_acc: 0.7732
Epoch 28/128 loss: 0.5940 - acc: 0.7995 - val_loss: 0.6984 - val_acc: 0.7682
Epoch 29/128 loss: 0.5799 - acc: 0.8035 - val_loss: 0.6792 - val_acc: 0.7732
```

#### Experiment 7

Keep dropout `0.4`. Increase the size of the conv kernels to 5, 4, 3. It is 25% slower to converge now.

```
----------------------------------------------------------------
        Layer (type)               Output Shape         Param #
================================================================
            Conv2d-1           [-1, 64, 34, 34]           4,864
              ReLU-2           [-1, 64, 34, 34]               0
           Dropout-3           [-1, 64, 34, 34]               0
            Conv2d-4           [-1, 64, 35, 35]          65,600
              ReLU-5           [-1, 64, 35, 35]               0
         MaxPool2d-6           [-1, 64, 17, 17]               0
           Dropout-7           [-1, 64, 17, 17]               0
            Conv2d-8           [-1, 64, 17, 17]          36,928
              ReLU-9           [-1, 64, 17, 17]               0
        MaxPool2d-10             [-1, 64, 8, 8]               0
          Dropout-11             [-1, 64, 8, 8]               0
          Flatten-12                 [-1, 4096]               0
           Linear-13                 [-1, 1024]       4,195,328
             ReLU-14                 [-1, 1024]               0
          Dropout-15                 [-1, 1024]               0
           Linear-16                   [-1, 10]          10,250
================================================================
Total params: 4,312,970
Trainable params: 4,312,970
Non-trainable params: 0
----------------------------------------------------------------
Input size (MB): 0.01
Forward/backward pass size (MB): 3.57
Params size (MB): 16.45
Estimated Total Size (MB): 20.04
----------------------------------------------------------------
None
Sequential(
  (0): Conv2d(3, 64, kernel_size=(5, 5), stride=(1, 1), padding=(3, 3))
  (1): ReLU()
  (2): Dropout(p=0.4, inplace=False)
  (3): Conv2d(64, 64, kernel_size=(4, 4), stride=(1, 1), padding=(2, 2))
  (4): ReLU()
  (5): MaxPool2d(kernel_size=2, stride=2, padding=0, dilation=1, ceil_mode=False)
  (6): Dropout(p=0.4, inplace=False)
  (7): Conv2d(64, 64, kernel_size=(3, 3), stride=(1, 1), padding=(1, 1))
  (8): ReLU()
  (9): MaxPool2d(kernel_size=2, stride=2, padding=0, dilation=1, ceil_mode=False)
  (10): Dropout(p=0.4, inplace=False)
  (11): Flatten(start_dim=1, end_dim=-1)
  (12): Linear(in_features=4096, out_features=1024, bias=True)
  (13): ReLU()
  (14): Dropout(p=0.4, inplace=False)
  (15): Linear(in_features=1024, out_features=10, bias=True)
)

Epoch 10/128 loss: 0.9208 - acc: 0.6797 - val_loss: 0.8662 - val_acc: 0.7005
Epoch 11/128 loss: 0.9089 - acc: 0.6877 - val_loss: 0.8920 - val_acc: 0.6915
Epoch 12/128 loss: 0.8897 - acc: 0.6921 - val_loss: 0.8208 - val_acc: 0.7225
Epoch 74/128 loss: 0.6342 - acc: 0.7939 - val_loss: 0.8204 - val_acc: 0.7305
Epoch 75/128 loss: 0.6333 - acc: 0.7929 - val_loss: 0.8204 - val_acc: 0.7332
```

#### Experiment 7

Keep dropout `0.4`. Decrease 1st kernel size to 4. Replace 2nd layer with 2 stride 2, and no maxpool.

```
----------------------------------------------------------------
        Layer (type)               Output Shape         Param #
================================================================
            Conv2d-1           [-1, 64, 35, 35]           3,136
              ReLU-2           [-1, 64, 35, 35]               0
           Dropout-3           [-1, 64, 35, 35]               0
            Conv2d-4           [-1, 64, 17, 17]          16,448
              ReLU-5           [-1, 64, 17, 17]               0
           Dropout-6           [-1, 64, 17, 17]               0
            Conv2d-7           [-1, 64, 17, 17]          36,928
              ReLU-8           [-1, 64, 17, 17]               0
         MaxPool2d-9             [-1, 64, 8, 8]               0
          Dropout-10             [-1, 64, 8, 8]               0
          Flatten-11                 [-1, 4096]               0
           Linear-12                 [-1, 1024]       4,195,328
             ReLU-13                 [-1, 1024]               0
          Dropout-14                 [-1, 1024]               0
           Linear-15                   [-1, 10]          10,250
================================================================
Total params: 4,262,090
Trainable params: 4,262,090
Non-trainable params: 0
----------------------------------------------------------------
Input size (MB): 0.01
Forward/backward pass size (MB): 2.62
Params size (MB): 16.26
Estimated Total Size (MB): 18.89
----------------------------------------------------------------
None
Sequential(
  (0): Conv2d(3, 64, kernel_size=(4, 4), stride=(1, 1), padding=(3, 3))
  (1): ReLU()
  (2): Dropout(p=0.4, inplace=False)
  (3): Conv2d(64, 64, kernel_size=(2, 2), stride=(2, 2))
  (4): ReLU()
  (5): Dropout(p=0.4, inplace=False)
  (6): Conv2d(64, 64, kernel_size=(3, 3), stride=(1, 1), padding=(1, 1))
  (7): ReLU()
  (8): MaxPool2d(kernel_size=2, stride=2, padding=0, dilation=1, ceil_mode=False)
  (9): Dropout(p=0.4, inplace=False)
  (10): Flatten(start_dim=1, end_dim=-1)
  (11): Linear(in_features=4096, out_features=1024, bias=True)
  (12): ReLU()
  (13): Dropout(p=0.4, inplace=False)
  (14): Linear(in_features=1024, out_features=10, bias=True)
)

Epoch 11/128 loss: 0.8360 - acc: 0.7085 - val_loss: 0.7795 - val_acc: 0.7306
Epoch 12/128 loss: 0.8094 - acc: 0.7172 - val_loss: 0.8019 - val_acc: 0.7252
Epoch 13/128 loss: 0.7945 - acc: 0.7251 - val_loss: 0.7806 - val_acc: 0.7335
Epoch 18/128 loss: 0.7136 - acc: 0.7519 - val_loss: 0.7390 - val_acc: 0.7451
Epoch 19/128 loss: 0.6975 - acc: 0.7588 - val_loss: 0.7449 - val_acc: 0.7444
Epoch 31/128 loss: 0.5868 - acc: 0.7993 - val_loss: 0.7268 - val_acc: 0.7598
Epoch 32/128 loss: 0.5723 - acc: 0.8059 - val_loss: 0.7468 - val_acc: 0.7498
Epoch 33/128 loss: 0.5728 - acc: 0.8076 - val_loss: 0.7365 - val_acc: 0.7497
Epoch 63/128 loss: 0.4539 - acc: 0.8523 - val_loss: 0.7841 - val_acc: 0.7638
Epoch 64/128 loss: 0.4536 - acc: 0.8510 - val_loss: 0.7778 - val_acc: 0.7673
Epoch 65/128 loss: 0.4383 - acc: 0.8557 - val_loss: 0.7657 - val_acc: 0.7653
Epoch 120/128 loss: 0.3808 - acc: 0.8823 - val_loss: 0.8550 - val_acc: 0.7584
Epoch 121/128 loss: 0.3802 - acc: 0.8809 - val_loss: 0.8441 - val_acc: 0.7626
```