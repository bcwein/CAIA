%% Colour and colour spaces
%
clear;
I = im2double(imread('peppers.png'));

%% RGB images
% Below is an RGB image.
figure;
imshow(I);

%% Red Channel
%
figure;
imshow(I(:, :, 1));

%% Green Channel
%
figure;
imshow(I(:, :, 2));

%% Blue Channel
%
figure;
imshow(I(:, :, 3));

%% RGB to CMY colour space
%
imshow(1 - I);

%% HSL - Hue Saturation Lightness
%
Ihsl = rgb2hsl(I);

%% Display Hue (Angle channel)
%
figure;
imshow(Ihsl(:, :, 1));

%% Display Saturation
%
figure;
imshow(Ihsl(:, :, 2));

%% Display Luminance
%
figure;
imshow(Ihsl(:, :, 3));

%% CIELAB colour space
% The most complete colour space there is.
Icie = rgb2lab(I);

%% Display the L (Luminance) channel
%
figure;
imshow(Icie(:,:,1),[0 100]);

%% Display the a channel
%
figure;
imshow(Icie(:,:,2),[-120 120]);

%% Display the b channel
%
figure;
imshow(Icie(:,:,3),[-120 120]);

%% Huffman Coding 
% Huffman coding does the following:
% 1. Sort gray levels based on probability.
% 2. Sum the two smallest probabilities.
% 3. Sort the new value into the list
% 4. Repeat until there is two probabilities.
% 5. Give code 0 to highest probability and vice versa
% 6. Go backwards throught the tree and repeat until all grey values have a
% code.

function hsl=rgb2hsl(rgb_in)
    %Converts Red-Green-Blue Color value to Hue-Saturation-Luminance Color value
    %
    %Usage
    %       HSL = rgb2hsl(RGB)
    %
    %   converts RGB, a M [x N] x 3 color matrix with values between 0 and 1
    %   into HSL, a M [x N] X 3 color matrix with values between 0 and 1
    %
    %See also hsl2rgb, rgb2hsv, hsv2rgb
    % (C) Vladimir Bychkovsky, June 2008
    % written using: 
    % - an implementation by Suresh E Joel, April 26,2003
    % - Wikipedia: http://en.wikipedia.org/wiki/HSL_and_HSV

    rgb=reshape(rgb_in, [], 3);

    mx=max(rgb,[],2);%max of the 3 colors
    mn=min(rgb,[],2);%min of the 3 colors
    L=(mx+mn)/2;%luminance is half of max value + min value

    S=zeros(size(L));

    % this set of matrix operations can probably be done as an addition...
    zeroidx= (mx==mn);
    S(zeroidx)=0;
    lowlidx=L <= 0.5;
    calc=(mx-mn)./(mx+mn);
    idx=lowlidx & (~ zeroidx);
    S(idx)=calc(idx);
    hilidx=L > 0.5;
    calc=(mx-mn)./(2-(mx+mn));
    idx=hilidx & (~ zeroidx);
    S(idx)=calc(idx);
    hsv=rgb2hsv(rgb);
    H=hsv(:,1);
    hsl=[H, S, L];
    hsl=round(hsl.*100000)./100000; 
    hsl=reshape(hsl, size(rgb_in));
end