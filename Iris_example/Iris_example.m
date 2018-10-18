% 'y' - yellow
% 'm' - magenta
% 'c' - cyan
% 'r' - red
% 'g' - green
% 'b' - blue
% 'w' - white
% 'k' - black
% sepal_length  sepal_width  petal_length    species
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

%testSplit(featureMatrix , labelVector); % Test 

[ sepal_length_splits sepal_width_splits petal_length_splits petal_width_splits] =  get_potential_splits(featureMatrix);

plotFeature(featureMatrix,labelVector);
vline(petal_width_splits,'k');
%hline(petal_width_splits ,'k');
%entropy = calculate_entropy(labelVector(51:150));

[data_above data_below] = split_data(data , 4 , 1.05);
overal_entropy = calculate_Overall_entropy(data_below , data_above)


plotFeature(featureMatrix,labelVector);
hold on;
vline( 1.05 ,'k');

