# 1 - Getting Started


Load the data that we will use.



```matlab:Code
I = imread('lab1/images/napoleon.png');
Il = imread('lab1/images/napoleon_light.png');
Id = imread('lab1/images/napoleon_dark.png');
Z = imread('lab1/images/zebra.png');
```

# 2 - Viewing Images and Saving Images


Below is one of the example images we will work on.



```matlab:Code
imtool(I);
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


Plot all three different example images. Regular, light and dark.



```matlab:Code
imtool(I);
imtool(Il);
```


![figure_2.png](lab1_images/figure_2.png)


```matlab:Code
imtool(Id);
```


![figure_3.png](lab1_images/figure_3.png)


![figure_4.png](lab1_images/figure_4.png)

# Q2 - Histograms


From figure 1, which is the regular image, we see that the pixel values are spread across the domain <img src="https://latex.codecogs.com/gif.latex?\inline&space;0,255"/>. The second figure is skewed towards the lighter pixel values and this image should be the high contrast one. The third histogram shows the third image and how it is skewed in the other direction and is thus the histogram of the low contrast image.



```matlab:Code
figure(1);
imhist(I);
```


![figure_5.eps](lab1_images/figure_5.eps)


```matlab:Code

figure(2);
imhist(Il);
```


![figure_6.eps](lab1_images/figure_6.eps)


```matlab:Code

figure(3);
imhist(Id);
```


![figure_7.eps](lab1_images/figure_7.eps)

# See images

```matlab:Code
Is = single(I);
imtool(I);
imtool(Is);
```


![figure_8.png](lab1_images/figure_8.png)


```matlab:Code
imtool(Is/255);
```


![figure_9.png](lab1_images/figure_9.png)


![figure_10.png](lab1_images/figure_10.png)

# Q3 - Explain differences

```matlab:Code
figure(1);
imtool((I/64)*64);

figure(2);
imtool((Is/64)*64);
```


![figure_11.png](lab1_images/figure_11.png)


![figure_12.png](lab1_images/figure_12.png)

# Q4 - Make images brighter

```matlab:Code
imtool(I + 50);
imtool(I);
```


![figure_13.png](lab1_images/figure_13.png)


![figure_14.png](lab1_images/figure_14.png)

# Q5 - Make images lower contrast

```matlab:Code
imtool(I);
imtool(I * 0.5);
```


![figure_15.png](lab1_images/figure_15.png)


![figure_16.png](lab1_images/figure_16.png)

# Q6 - Pixel Wise Transforms

```matlab:Code
figure(1);
imhist(I);

figure(2);
imshow(I);
```


![figure_17.png](lab1_images/figure_17.png)


```matlab:Code

g = 0.5;
L = double(I).^g;
out = uint8(L .* (255/max(max(L))));

figure(3);
imhist(out);

figure(4);
imshow(out);
```


![figure_18.png](lab1_images/figure_18.png)


![figure_19.eps](lab1_images/figure_19.eps)


![figure_20.eps](lab1_images/figure_20.eps)


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

figure(2);
imshow(histeq(I));

figure(3);
```


![figure_27.png](lab1_images/figure_27.png)


![figure_28.png](lab1_images/figure_28.png)


```matlab:Code
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


![figure_41.png](lab1_images/figure_41.png)


![figure_42.png](lab1_images/figure_42.png)

