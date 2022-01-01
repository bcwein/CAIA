%% Classification
%
clear;
I = im2double(imread('peppers.png'));
imagesc(I);

%% Pixel-Wise Classification
%
[a, b] = size(I);

%% Create training labels
%
T = zeros(a,b); % Create an empty image

%% Training data label - Foreground
%
T(125:275, 100:380, :) = 1;

%% Training data label - Background
%
T(1:75, 1:200, :) = 2; 
T(320:end, 100:300, :) = 2;

%% Show train classifier
%
figure;
imagesc(T);

%% Investigate usable bands
%
[data,class] = create_training_data(I(:,:,[1,2]), T);
figure;
scatterplot2D(data, class);

%% Classify data based on all bands - Linear
% Belo we see the decision boundary of the linear classifier
[X,Y] = meshgrid(linspace(0,1),linspace(0,1));
X = X(:); Y = Y(:);
sampleData = [X Y];

[C, err, posterior, logp, coeff] = classify(sampleData, data, class);

K = coeff(1,2).const;
L = coeff(1,2).linear;

hold on
scatterplot2D(data, class);
h2 = gscatter(X,Y,C,'rb','.',1,'off');
f = @(x,y) K + L(1)*x + L(2)*y;
h3 = fimplicit(f,[0 1 0 1]);
h3.Color = 'm';
h3.LineWidth = 2;
h3.DisplayName = 'Decision Boundary';
hold off
axis tight
xlabel('Red')
ylabel('Green')
title('Classification using Linear Discriminant Analysis')

%% Classify data based on all bands - Quadratic
% Belo we see the decision boundary of the quadratic discriminant function
[X,Y] = meshgrid(linspace(0,1),linspace(0,1));
X = X(:); Y = Y(:);
sampleData = [X Y];

[C, err, posterior, logp, coeff] = classify(sampleData, data, class, 'quadratic');

K = coeff(1,2).const;
L = coeff(1,2).linear;
Q = coeff(1,2).quadratic;

hold on
scatterplot2D(data, class);
h2 = gscatter(X,Y,C,'rb','.',1,'off');
f = @(x,y) K + L(1)*x + L(2)*y + Q(1,1)*x.*x + (Q(1,2)+Q(2,1))*x.*y + Q(2,2)*y.*y;
h3 = fimplicit(f,[0 1 0 1]);
h3.Color = 'm';
h3.LineWidth = 2;
h3.DisplayName = 'Decision Boundary';
hold off
axis tight
xlabel('Red')
ylabel('Green')
title('Classification using Quadratic Discriminant Analysis')