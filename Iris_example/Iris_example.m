% 'y' - yellow
% 'm' - magenta
% 'c' - cyan
% 'r' - red
% 'g' - green
% 'b' - blue
% 'w' - white
% 'k' - black
% sepal_length  sepal_width  petal_length petal_width species
%      1             2            3            4         5
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

potential_splits =  get_potential_splits(data);
[best_split_column best_split_value] = determine_best_split(data , potential_splits);

for k = keys(potential_splits)
  thekey = k{1}; % The curly braces are the key, so to speak
   h = potential_splits(thekey);
end

h

plotFeature(featureMatrix,labelVector);
vline(potential_splits('4'),'k');


%hline(petal_width_splits ,'k');
%entropy = calculate_entropy(labelVector(51:150));

[data_above data_below] = split_data(data , 4 , 1.05);
overal_entropy = calculate_Overall_entropy(data_below , data_above);


plotFeature(featureMatrix,labelVector);
hold on;
vline( 1.05 ,'k');


