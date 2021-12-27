%% Image Processing
% In this section we will look at image processing in the spatial domain.
% Today we will work on pointwise spatial image processing. I.e processing
% that works one pixel at a time.
clear;
I = imread('peppers.png');

%% Noise reduction using image mean or medians. 
% Below we have our demo image
figure;
imshow(rgb2gray(I));

%% Add noise to n images
% Below a noisy image is shown.

n = 10;
I_n = imnoise(I, 'gaussian');
for i = 1:n-1
    I_n = cat(3, I_n, imnoise(I, 'gaussian'));
end

figure;
imshow(I_n(:, :, 1));

%% Calculate the mean image to reconstruct a denoised image.
% Below is the mean image of 10 noisy images.
figure;
I_mean = uint8(mean(double(I_n), 3));
imshow(I_mean);

%% Detect changes using subtraction.
%
figure;
imshow(rgb2gray(I) - I_mean);

%% The Negative Transform - Inverse.
%
figure;
imshow(imneg(I));

%% Negative Transform for grayscale images.
%
figure;
imshow(imneg(I));

%% Brightness transform.
%
figure;
imshow(imbright(I, 30));

%% Contrast transform.
%
figure;
imshow(imcontrast(I, 1.2));

%% Gamma transform.
%
figure;
imshow(imgamma(I, 1, 0.25));

%% Image Histogram
%
figure;
imhist(I(:, :, 1));

%% Functions
%
function f = imneg(im)
    f = max(im(:)) - im;
end

function f = imbright(im, C)
    f = im + C;
end

function f = imcontrast(im, C)
    f = im * (1/C);
end

function f = imgamma(im, C, g)
    f = (1/C) * imadjust(im,[],[],g);
end

function f = imlog(im, C)
    f = C*log(1 + im);
end