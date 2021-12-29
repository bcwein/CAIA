%% Freqyency Filtering
% We will do filtering of images in the freqyency domain in this lecture.
clear;
I = rgb2gray(imread('peppers.png'));

%% Fourier transform.
%
I_f = fftshift(fft2(I));
figure;
imshowpair(I, log(abs(I_f)), 'montage');

%% Low Pass filtering in frequency domain.
%
I_f = fftshift(fft2(I));
r = 30;
[x, y] = size(I_f);
[xgrid, ygrid] = meshgrid(1:size(I_f,2), 1:size(I_f,1));
mask = ((xgrid-(y/2)).^2 + (ygrid-(x/2)).^2) >= r.^2;
I_f(mask) = 0;
figure; imagesc(log(abs(I_f))); colormap(gray); colorbar();

%% Perform inverse fourier transform to get filtered image.
%
newim = ifft2(ifftshift(I_f));
figure; imagesc(abs(newim)); colormap(gray); colorbar();