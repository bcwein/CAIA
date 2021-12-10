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
% function *bwdist* gives us a distance transformed binary image. Since we
% dont pass any other arguments to the method. Euclidean distance is used.
figure;
Idist = bwdist(bI);
imshow(mat2gray(Idist));

%% Remove small noisy max values for watershed
% Watershed is starting from all local max values which creates additional
% small objects on overlapping coins. This is used to avoid watershed
% transform to start in between the overlapping coins
figure;
Idistext = imextendedmax(Idist, 3);
imshow(Idistext);

%% Apply watershed filter to isolate objects.
% We use the watershed filter to do the segmentation of the coins. We have
% to invert the image to start from the centers of the coins and not on the
% background.
figure;
Idistext = -Idistext;
Idistext(bI) = Inf;
Iwshed = watershed(Idistext,8);
Iwshed(bI) = 0;
imshow(Iwshed);

%% Label Objects
% Now we have to label the coins in the image. This can be done with
% *bwlabel*.
figure;
Ilabel = bwlabel(Iwshed);
Irgb = label2rgb(Ilabel,'spring');
imshow(Irgb);

%% Lastly, find properties of objects
% We use *regionprops* on the labeled image. We select MajorAxisLength 
% as the only property that we are interested in which seem to be the 
% closest to the radii of the coins

figure;
F = regionprops(Ilabel,'MajorAxisLength');
Radii = [F.MajorAxisLength];
hist(Radii, 20);

%% Count the number of coins in the image.
% Since the regionprops method retuns attributes for all the identified
% regions in the image. This would be equivalent to the number of coins in
% our method. We find that there are 52 objects in the image. I.e 52 coins.
size(F)


%% Errors and Limitations
% Our algorithm performs quite well on identifying the coins in the image.
% Which makes it quite easy to do a simple count of the number of objects
% in the image. The harder part is estimating the amount of money in the
% image. One approach is to use the area to estimate what value the object
% has if you know which coin has which area you can use a histogram to
% calculate the number of objects in a certain area range and multiply this
% number with the corresponding monetary value.
% 
% A problem with this method in our implementation is that we have objects
% on the border, where the coins are cut in half and their area not correct
% with respect to their value. This makes estimating the amount of money
% hard and this is one of the main disadvantages to our method.

%% Test on Bacteria.tif
% 
clear;
I = imread('lab3/images/bacteria.tif');
figure; imshow(I);

%% Plot image histogram
% Let's plot the histogram as well. We see that this histogram is not as
% well seperated as before. Let's run the same segmentation as before.
figure; imhist(I);
T = graythresh(I);
bI = medfilt2(im2bw(I, T));
figure; imshow(bI);

%% Apply dist transform to detect coins centers
% Above we saw that regular separation by threshold does not work as well
% in the case of the bacteria image. Let's see how this affects the dist
% transform.
figure;
Idist = bwdist(bI);
imshow(mat2gray(Idist));

%% Do the last steps on the bacteria image.
% We are also successful in labeling the bin
figure;
Idistext = imextendedmax(Idist, 3);
imshow(Idistext);

figure;
Idistext = -Idistext;
Idistext(bI) = Inf;
Iwshed = watershed(Idistext,8);
Iwshed(bI) = 0;
imshow(Iwshed);

figure;
Ilabel = bwlabel(Iwshed);
Irgb = label2rgb(Ilabel,'spring');
imshow(Irgb);

%% Lastly, find properties of objects
% We use *regionprops* on the labeled image. We select area as the only 
% property that we are interested in. 
figure;
F = regionprops(Ilabel,'Area');
Areas = [F.Area];
hist(Areas, 20);

%% Discussion on bacteria implementation
% The method developed for coins also works quite well. But as discussed
% above, the histogram is not well separated. This means that the
% segmentation produces some unrelevant objects from the background.
% Using other threshold methods or filtering the background 
% may improve the code above.