%%Load data using sorted files by sort_files.m
close all, clear all; % Close all figures, and clear all variables

imds = imageDatastore("sorteddata\",'IncludeSubfolders',true,"LabelSource","foldernames");


%%Create train and validation sets, initialize augmentor
imds = shuffle(imds);
nFiles = length(imds.Files);
RandIndices = randperm(nFiles);
train_i = round(0.8*nFiles);
train_indices = RandIndices(1:train_i);
val_indices = RandIndices(train_i+1:nFiles);
train_files = subset(imds,train_indices); 

imageAugmenter = imageDataAugmenter( ...
    'RandRotation',[-20,20], ...
    'RandXShear',[-10 10], ...
    'RandYShear',[-10 10], ...
    'RandXScale',[0.75 1.5], ...
    'RandYScale',[0.75 1.5], ...
    'RandXTranslation',[-10 10], ...
    'RandYTranslation',[-10 10]);

train_files = augmentedImageDatastore([225 301],train_files,'DataAugmentation',imageAugmenter);
val_files = subset(imds,val_indices); 

%%Setup network
layers = [
    imageInputLayer([225 301 1])
    
    convolution2dLayer(10,6,'Stride',[3 3])
    batchNormalizationLayer
    reluLayer
    
    convolution2dLayer(5,12,'Stride',[2 2])
    batchNormalizationLayer
    reluLayer
    
    convolution2dLayer(4,24,'Stride',[2 2])
    batchNormalizationLayer
    reluLayer

    fullyConnectedLayer(200)
    
    fullyConnectedLayer(27)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',70, ...
    'Shuffle','every-epoch', ...
    'ValidationData',val_files, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'OutputNetwork','best-validation-loss',...
    'Plots','training-progress');

%%train network

net = trainNetwork(train_files,layers,options);

%%check accuracy

YPred = classify(net,val_files);
YValidation = val_files.Labels;
accuracy = sum(YPred == YValidation)/numel(YValidation)