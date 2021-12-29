%% Segmentation.
% We will do segmentation on the image below.
clear;
I = rgb2gray(imread('peppers.png'));
figure;
imshow(I);

%% Global Thresholding Using iterative global thresholding
%
figure;
imshow(kmeans(I, 128));

%% Otsu's thresholding method
% Otsu's method is implemented in matlabs graythresh function.
level = graythresh(I);
BW = imbinarize(I,level);
figure;
imshow(BW);

%% Adaptive thresholding by filtering
%
se = strel('disk', 25);
J = imclose(BW, se);
figure;
imshow(J);

%% Local Thresholding using first order statistics
%
T = adaptthresh(I);
BW = imbinarize(I, T);
figure;
imshow(BW);

%% Hysteresis thresholding.
%
thresh = multithresh(I, 2);
T1 = thresh(1);
T2 = thresh(2);
K = hysthresh(I, T1, T2, 4);
figure;
imshow(K);

%% Functions
%
function t = kmeans(im, it)
    ti = it;
    ubg = round(mean(im(im < ti)));
    ufg = round(mean(im(im >= ti)));
    tin = (ubg + ufg)/2;
    while ti ~= tin
        ti = tin;
        ubg = round(mean(im(im < ti)));
        ufg = round(mean(im(im >= ti)));
        tin = round(ubg + ufg)/2;
    end
    im(im < tin) = 0;
    im(im >= tin) = 255;
    t = im;
end

function bw = hysthresh(im, T1, T2, conn)

% arguments
if nargin < 3
    disp('hysthresh needs at least 3 inputs');
    return;
elseif nargin == 3
    disp('inputs = 3, using 4 connectivity');
    conn = 4;    
end


if T1 < T2    % T1 and T2 reversed - swap values
    tmp = T1;
    T1 = T2;
    T2 = tmp;
end

aboveT2 = im > T2;                     % Edge points above lower
% threshold.
[aboveT1r, aboveT1c] = find(im > T1);  % Row and colum coords of points
% above upper threshold.

% Obtain all connected regions in aboveT2 that include a point that has a
% value above T1
bw = bwselect(aboveT2, aboveT1c, aboveT1r, conn);

end