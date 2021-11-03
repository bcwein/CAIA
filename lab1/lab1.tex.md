# 1 - Getting Started


Load the data that we will use.



```matlab:Code
I = imread('lab1/images/napoleon.png');
Il = imread('lab1/images/napoleon_light.png');
Id = imread('lab1/images/napoleon_dark.png');
Z = imread('lab1/images/zebra.png');
```

# 2 - Viewing Images and Saving Images

```matlab:Code
imshow(I);
```


![figure_0.png](lab1_images/figure_0.png)

# 2 - Image Tool

```matlab:Code
imtool(I);
```


![figure_1.png](lab1_images/figure_1.png)

# Q1 - Pixel Value


Print out value. We see that it is of type UINT-8 and 



```matlab:Code
I(1, 1)         % It prints out 89
```


```text:Output
ans = 89
```

# 3 - Contrast, Brightness and Datatypes

```matlab:Code
imtool(I);
```


![figure_2.png](lab1_images/figure_2.png)


```matlab:Code
imtool(Il);
```


![figure_3.png](lab1_images/figure_3.png)


```matlab:Code
imtool(Id);
```


![figure_4.png](lab1_images/figure_4.png)

# 3 Histograms

```matlab:Code
figure(1);
h1 = histogram(single(I(:)),256);
h1.BinLimits = [0, 255];
grid;
```


![figure_5.eps](lab1_images/figure_5.eps)


```matlab:Code

figure(2);
h2 = histogram(single(Il(:)),256);
h2.BinLimits = [0, 255];
grid;
```


![figure_6.eps](lab1_images/figure_6.eps)


```matlab:Code

figure(3);
h3 = histogram(single(Id(:)),256);
h3.BinLimits = [0, 255];
grid;
```


![figure_7.eps](lab1_images/figure_7.eps)

# Explore workspace

```matlab:Code
whos;
```


```text:Output
  Name        Size               Bytes  Class                                        Attributes

  I         368x445             163760  uint8                                                  
  Id        368x445             163760  uint8                                                  
  Il        368x445             163760  uint8                                                  
  Is        368x445             655040  single                                                 
  J         368x445             163760  uint8                                                  
  Jnf        78x78                6084  uint8                                                  
  L         368x445            1310080  double                                                 
  T           1x256               2048  double                                                 
  Z         512x512             262144  logical                                                
  ans         1x1                    1  uint8                                                  
  g           1x1                    8  double                                                 
  h1          1x1                    8  matlab.graphics.chart.primitive.Histogram              
  h2          1x1                    8  matlab.graphics.chart.primitive.Histogram              
  h3          1x1                    8  matlab.graphics.chart.primitive.Histogram              
  out       368x445             163760  uint8                                                  
```


```matlab:Code
class(I);
```

# See images

```matlab:Code
Is = single(I);
imtool(I);
```


![figure_8.png](lab1_images/figure_8.png)


```matlab:Code
imtool(Is);
```


![figure_9.png](lab1_images/figure_9.png)


```matlab:Code
imtool(Is/255);
```


![figure_10.png](lab1_images/figure_10.png)

# Q3 - Explain differences

```matlab:Code
figure(1);
imtool((I/64)*64);
```


![figure_11.png](lab1_images/figure_11.png)


```matlab:Code

figure(2);
imtool((Is/64)*64);
```


![figure_12.png](lab1_images/figure_12.png)

# Q4 - Make images brighter

```matlab:Code
imtool(I + 50);
```


![figure_13.png](lab1_images/figure_13.png)


```matlab:Code
imtool(I);
```


![figure_14.png](lab1_images/figure_14.png)

# Q5 - Make images lower contrast

```matlab:Code
imtool(I);
```


![figure_15.png](lab1_images/figure_15.png)


```matlab:Code
imtool(I * 0.5);
```


![figure_16.png](lab1_images/figure_16.png)

# Q6 - Pixel Wise Transforms

```matlab:Code
figure(1);
imhist(I);
```


![figure_17.eps](lab1_images/figure_17.eps)


```matlab:Code

figure(2);
imshow(I);
```


![figure_18.png](lab1_images/figure_18.png)


```matlab:Code

g = 0.5;
L = double(I).^g;
out = uint8(L .* (255/max(max(L))));

figure(3);
imhist(out);
```


![figure_19.eps](lab1_images/figure_19.eps)


```matlab:Code

figure(4);
imshow(out);
```


![figure_20.png](lab1_images/figure_20.png)


```matlab:Code

g = 2;
L = double(I).^g;
out = uint8(L .* (255/max(max(L))));

figure(5)
imhist(out);
```


![figure_21.eps](lab1_images/figure_21.eps)


```matlab:Code

figure(6);
imshow(out);
```


![figure_22.png](lab1_images/figure_22.png)

# Q7 - Histogram Equalization napoleon - Histogram

```matlab:Code
figure(1);
imhist(I);
```


![figure_23.eps](lab1_images/figure_23.eps)


```matlab:Code

figure(2);
imhist(histeq(I));
```


![figure_24.eps](lab1_images/figure_24.eps)


```matlab:Code

figure(3);
imhist(histeq(Il));
```


![figure_25.eps](lab1_images/figure_25.eps)


```matlab:Code

figure(4);
imhist(histeq(Id));
```


![figure_26.eps](lab1_images/figure_26.eps)

# Q7 - Histogram Equalization napoleon - Images

```matlab:Code
figure(1);
imshow(I);
```


![figure_27.png](lab1_images/figure_27.png)


```matlab:Code

figure(2);
imshow(histeq(I));
```


![figure_28.png](lab1_images/figure_28.png)


```matlab:Code

figure(3);
imshow(histeq(Il));
```


![figure_29.png](lab1_images/figure_29.png)


```matlab:Code

figure(4);
imshow(histeq(Id));
```


![figure_30.png](lab1_images/figure_30.png)

# Q7 - Histogram, transform and cumulative histogram - Regular Image

```matlab:Code
[J,T] = histeq(I);

figure
plot((0:255)/255,T);
```


![figure_31.eps](lab1_images/figure_31.eps)


```matlab:Code

figure
plot(cumsum(imhist(I)) / sum(imhist(I)));
```


![figure_32.eps](lab1_images/figure_32.eps)


```matlab:Code

figure
plot(cumsum(imhist(J)) / sum(imhist(J)));
```


![figure_33.eps](lab1_images/figure_33.eps)

# Q7 - Histogram, transform and cumulative histogram - Light

```matlab:Code
[J,T] = histeq(Il);

figure
plot((0:255)/255,T);
```


![figure_34.eps](lab1_images/figure_34.eps)


```matlab:Code

figure
plot(cumsum(imhist(Il)) / sum(imhist(Il)));
```


![figure_35.eps](lab1_images/figure_35.eps)


```matlab:Code

figure
plot(cumsum(imhist(J)) / sum(imhist(J)));
```


![figure_36.eps](lab1_images/figure_36.eps)

# Q7 - Histogram, transform and cumulative histogram - Dark

```matlab:Code
[J,T] = histeq(Id);

figure
plot((0:255)/255,T);
```


![figure_37.eps](lab1_images/figure_37.eps)


```matlab:Code

figure
plot(cumsum(imhist(Id)) / sum(imhist(Id)));
```


![figure_38.eps](lab1_images/figure_38.eps)


```matlab:Code

figure
plot(cumsum(imhist(J)) / sum(imhist(J)));
```


![figure_39.eps](lab1_images/figure_39.eps)

# Q8 - Aliasing when sampling

```matlab:Code
Jnf = imresize(I, [78 78], 'nearest', 'antialiasing', false);
imshow(Jnf);
```


![figure_40.png](lab1_images/figure_40.png)
