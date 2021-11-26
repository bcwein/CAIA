%% Load Image
%
% Let's read the image and plot it
clear;
I = imread('lab3/images/coins.tif');
figure; imagesc(I); colormap(gray); colorbar();

%% Plot image histogram
% Let's plot the histogram as well.
figure; imhist(I);

%% Segment foreground and background.
% To start segmenting, we will have to distinguish background and
% foreground pixels. From the histogram, a simple threshold should be able
% to do a OK job and we will implement that first. The function
% *graythresh* will find an appropriate thresholdvalue $T$ and we use the
% function *im2bw* to calculate the binary image.
%
% Additionally, we apply a median filter with medfilt2 to remove the white
% noise in the coins.
T = graythresh(I);
bI = medfilt2(~im2bw(I, T));
figure; imagesc(bI), colormap(gray); colorbar();

%% Erode images
% Some of the coins are overlapping and we will have to do some erosion.
se = strel('disk', 17);
beI = imerode(bI, se);
figure; imagesc(beI); colormap(gray); colorbar();

%% Label Objects
% 
Ilabel = bwlabel(beI, 4);
figure; imshow(label2rgb(Ilabel, 'spring'));

%% Extract features from image.
%
F = regionprops('Table', Ilabel);

%% Plot centroids of image
% We see that the we have problems with the centroids 
figure;
imshow(I);
axis image; % Make sure image is not artificially stretched because of screen's aspect ratio.
hold on;
numberOfBoundaries = size(F.Centroid, 1);
for k = 1 : numberOfBoundaries
	plot(floor(F.Centroid(k, 1)), floor(F.Centroid(k, 2)), 'r+', 'MarkerSize', 30, 'LineWidth', 2);
end
hold off;

%%
% Plot histogram of areas

A = [F.Area];
hist(A);