%% Read Data
camera = imread('lab2/images_lab2/cameraman.png');

%% Q1 - Different Kernels
% We will apply three different kernels in the spatial domain with one
% sharpening, one smoothing and apply them in different sizes.
% 
% Firstly we begin with showing the original image that we will use.
figure;
imshow(camera);

%%
% Now, let's introduce a mean filter of size $3 \times 3$ and apply the
% convolution using *imfilter*. The mean filtered image is shown below.

h1 = fspecial('average', 3);
meancamera3 = imfilter(camera, h1);

figure;
imshow(meancamera3);

%%
% And using mean filter of sie $7 \times 7$ we get
h2 = fspecial('average', 7);
meancamera7 = imfilter(camera, h2);

figure;
imshow(meancamera7);

%%
% And lastly, a $31 \times 31$ mean filter.
%
h3 = fspecial('average', 31);
meancamera31 = imfilter(camera, h3);

figure;
imshow(meancamera31);