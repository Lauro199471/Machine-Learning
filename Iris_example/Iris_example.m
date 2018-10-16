% sepal_length sepal_width petal_length petal_width species

clear;
for clc = 0:30
    disp(" ");
end
% ========== Main ===========
% Load and Prepare Data
data = csvread('iris.csv');
featureMatrix = data(:, 1:size(data,2)-1);
labelVector = data(:,size(data,2));

% Plot Data
plotFeature(featureMatrix,labelVector);

A = classify_data(labelVector)