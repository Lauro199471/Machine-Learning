% 'y' - yellow
% 'm' - magenta
% 'c' - cyan
% 'r' - red
% 'g' - green
% 'b' - blue
% 'w' - white
% 'k' - black
% sepal_length  sepal_width  petal_length  petal_width  species
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
%testSplit(featureMatrix , labelVector); % Test 

%[ sepal_length_splits sepal_width_splits petal_length_splits petal_width_splits] =  get_potential_splits(featureMatrix);

%figure(1);
%vline(petal_length_splits,'k');
%hline(petal_width_splits ,'k');

entropy = calculate_entropy(labelVector(1:50))




