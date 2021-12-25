%% Introduction

%% Digital Images
%
% Digital images can be thought of as a function $$f(x,y)$$ that represent
% values at certain coordinates. There is a finite amount of coordinates.
% Since the digital image is a representation of something that is
% continious by nature, spatial sampling must be done, i.e Discretising a 
% continuous function in terms of coordinate values. Grey-level 
% quantization is a discretisation of amplitude values.

%% Spatial Sampling
% Below, we can see examples of spatial sampling.
I = imread('peppers.png');
Idim = size(I);
I = imresize(I,[Idim(1), Idim(1)]);
Idim = size(I);

I128 = imresize(I,[128, 128]);
I64 = imresize(I,[64, 64]);
I32 = imresize(I,[32, 32]);

figure;
subplot(2,2,1),imshow(I),title(Idim(2));hold  on
subplot(2,2,2),imshow(I128),title(128);
subplot(2,2,3),imshow(I64),title(64);
subplot(2,2,4),imshow(I32),title(32);hold off;

%% Intensity and visual information
% Another limit in digital images is the number of different pixel values that
% the individual discrete points can have. 
J = rgb2gray(I);
J16 = imintlim(J, 16);
J3 = imintlim(J, 3);

figure;
subplot(3,2,1),imshow(J),title(256);hold on
subplot(3,2,2),imhist(J),title(256);
subplot(3,2,3),imshow(J16),title(16);
subplot(3,2,4),imhist(J16),title(16);
subplot(3,2,5),imshow(J3),title(3);
subplot(3,2,6),imhist(J3),title(3); hold off

%% Gray Level Quantization
% 
figure;

thresh = multithresh(J, 16);
valuesMax = [thresh max(J(:))];
[J_16, index] = imquantize(J, thresh, valuesMax); 

thresh = multithresh(J, 3);
valuesMax = [thresh max(J(:))];
[J_3, index] = imquantize(J, thresh, valuesMax); 

subplot(3,1,1),imshow(J),title(256); hold on
subplot(3,1,2),imshow(J_16),title(16);
subplot(3,1,3),imshow(J_3),title(3); hold off;

%% Functions
%
function im = imintlim(im, n)
    step = ceil(256/n);
    im = ceil(im./step)*step;
end