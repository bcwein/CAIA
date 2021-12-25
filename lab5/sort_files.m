close all, clear all; % Close all figures, and clear all variables

%% Load the labels
true_labels = importdata('labels.txt');

N = size(true_labels,1);
for k = 1:N
    im = imread(sprintf('imagedata/train_%04d.png', k));
    val = tri_encode(true_labels(k,:));
    mkdir(sprintf('sorteddata/%02d',val))
    imwrite(im,sprintf('sorteddata/%02d/train_%04d.png',val,k));
end
