%% 1 -  Getting Started
%
% Load the data that we will use.
%

I = imread('lab1/images/napoleon.png');
Il = imread('lab1/images/napoleon_light.png');
Id = imread('lab1/images/napoleon_dark.png');
Z = imread('lab1/images/zebra.png');

%% 2 - Viewing Images and Saving Images
% Below is one of the example images we will work on.
imtool(I);

%% 2 - Image Tool
imtool(I);

%% Q1 - Pixel Value
% Print out value. We see that it is of type UINT-8 and 
I(1, 1)         % It prints out 89

%% 3 - Contrast, Brightness and Datatypes
% Plot all three different example images. Regular, light and dark.
imtool(I);
imtool(Il);
imtool(Id);

%% Q2 - Histograms 
% From figure 1, which is the regular image, we see that the pixel values
% are spread across the domain $\[0, 255\]$.
% The second figure is skewed towards the lighter pixel values and this
% image should be the high contrast one. The third histogram shows the
% third image and how it is skewed in the other direction and is thus the
% histogram of the low contrast image.
figure(1);
imhist(I);

figure(2);
imhist(Il);

figure(3);
imhist(Id);

%% See images 
Is = single(I);
imtool(I);
imtool(Is);
imtool(Is/255);

%% Q3 - Explain differences
figure(1);
imtool((I/64)*64);

figure(2);
imtool((Is/64)*64);

%% Q4 - Make images brighter
imtool(I + 50);
imtool(I);

%% Q5 - Make images lower contrast
imtool(I);
imtool(I * 0.5);

%% Q6 - Pixel Wise Transforms
figure(1);
imhist(I);

figure(2);
imshow(I);

g = 0.5;
L = double(I).^g;
out = uint8(L .* (255/max(max(L))));

figure(3);
imhist(out);

figure(4);
imshow(out);

g = 2;
L = double(I).^g;
out = uint8(L .* (255/max(max(L))));

figure(5)
imhist(out);

figure(6);
imshow(out);

%% Q7 - Histogram Equalization napoleon - Histogram
figure(1);
imhist(I);

figure(2);
imhist(histeq(I));

figure(3);
imhist(histeq(Il));

figure(4);
imhist(histeq(Id));

%% Q7 - Histogram Equalization napoleon - Images
figure(1);
imshow(I);

figure(2);
imshow(histeq(I));

figure(3);
imshow(histeq(Il));

figure(4);
imshow(histeq(Id));

%% Q7 - Histogram, transform and cumulative histogram - Regular Image
[J,T] = histeq(I);

figure
plot((0:255)/255,T);

figure
plot(cumsum(imhist(I)) / sum(imhist(I)));

figure
plot(cumsum(imhist(J)) / sum(imhist(J)));

%% Q7 - Histogram, transform and cumulative histogram - Light
[J,T] = histeq(Il);

figure
plot((0:255)/255,T);

figure
plot(cumsum(imhist(Il)) / sum(imhist(Il)));

figure
plot(cumsum(imhist(J)) / sum(imhist(J)));

%% Q7 - Histogram, transform and cumulative histogram - Dark
[J,T] = histeq(Id);

figure
plot((0:255)/255,T);

figure
plot(cumsum(imhist(Id)) / sum(imhist(Id)));

figure
plot(cumsum(imhist(J)) / sum(imhist(J)));

%% Q8 - Aliasing when sampling
Jnf = imresize(I, [78 78], 'nearest', 'antialiasing', false);
imshow(Jnf);