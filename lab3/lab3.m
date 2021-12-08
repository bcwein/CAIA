%% Computer Exercise 3 -  Group 17

%% Load Image
%
% Let's read the image and plot it.
clear;
I = imread('lab3/images/coins.tif');
figure; imshow(I);

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
bI = medfilt2(im2bw(I, T));
figure; imshow(bI);

%% Apply dist transform to detect coins centers
% To try to identify coin centers. We will use the dist transform. The
% function bwdist gives us a distance transformed binary image. Since we
% dont pass any other arguments to the method. Euclidean distance is used.
figure;
Idist = bwdist(bI);
imshow(mat2gray(Idist));

%% Remove small noisy max values for watershed
% 
figure;
Idistext = imextendedmax(Idist,3);
imshow(Idistext);

%% Apply watershed filter to isolate objects.
%
figure;
Idistext = -Idistext;
Idistext(bI) = Inf;
Iwshed = watershed(Idistext,8);
Iwshed(bI) = 0;
imshow(Iwshed);

%% Label Objects
% Now we have to label the coins in the image. This can be done with
% bwlabel.
figure;
Ilabel = bwlabel(Iwshed);
Irgb = label2rgb(Ilabel,'spring');
imshow(Irgb);

%% Lastly, find properties of objects
figure;
F = regionprops(Ilabel,'all');
Areas = [F.Area];
hist(Areas,100);
