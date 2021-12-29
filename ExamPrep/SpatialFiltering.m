%% Spatial Filtering
% We will do filtering of images in the spatial domain in this lecture.
clear;
I = rgb2gray(imread('peppers.png'));

%% Gaussian Filtering.
% Below we have a noisy image
I_n = imnoise(I, 'gaussian');
figure;
imshow(I_n);

%% Let's try to remove the noise by applying a gaussian filter
%
figure;
imshow(imgaussfilt(I_n, 1));

%% Median Filter
%
figure;
K = medfilt2(I_n);
imshowpair(I_n, K,'montage');

%% Median Filter and salt & pepper noise.
% Median filtering is especially good for salt and pepper noise.
figure;
I_sp = imnoise(I, 'salt & pepper');
K = medfilt2(I_sp);
imshowpair(I_sp, K,'montage');

%% Laplace Filter
% To sharpen images, instead of using mean or median, we use the
% derivative.

% Convert into double format.
k1=double(I);

% Define the Laplacian filter.
Laplacian=[0 1 0; 1 -4 1; 0 1 0];

% Convolve the image using Laplacian Filter
k2=conv2(k1, Laplacian, 'same');

figure;
imshowpair(k1, k2, 'montage');

%% Erosion
%
originalBW = imread('text.png');
se = strel('line',11,90);
erodedBW = imerode(originalBW,se);
imshowpair(originalBW, erodedBW, 'montage');

%% Dilation
%
dilatedBW = imdilate(originalBW,se);
imshowpair(originalBW, dilatedBW, 'montage');