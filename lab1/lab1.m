%% 1 -  Getting Started
%
% Load the data that we will use.
%

I = imread('lab1/images/napoleon.png');
Il = imread('lab1/images/napoleon_light.png');
Id = imread('lab1/images/napoleon_dark.png');
Z = imread('lab1/images/zebra.png');

%% 2 - Viewing Images and Saving Images
imshow(I);

%% 2 - Image Tool
imtool(I);

%% Q1 - Pixel Value
% Print out value. We see that it is of type UINT-8 and 
I(1, 1)         % It prints out 89

%% 3 - Contrast, Brightness and Datatypes
imtool(I);
imtool(Il);
imtool(Id);

%% 3 Histograms 

figure(1);
h1 = histogram(single(I(:)),256);
h1.BinLimits = [0, 255];
grid;

figure(2);
h2 = histogram(single(Il(:)),256);
h2.BinLimits = [0, 255];
grid;

figure(3);
h3 = histogram(single(Id(:)),256);
h3.BinLimits = [0, 255];
grid;

%% Explore workspace
whos;
class(I);

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