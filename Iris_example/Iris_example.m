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

[ sepal_length_splits sepal_width_splits petal_length_splits petal_width_splits] =  get_potential_splits(featureMatrix);

figure(1);
vline(petal_length_splits,'k');
hline(petal_width_splits ,'k');


% ======= TEST For Split petal_width = 0.8 ===============
[data_above data_below] = split_data(featureMatrix , 4 , 0.8);
petal_length  = featureMatrix(:,3);

% data_below
setosa_index = find(labelVector == 0);
petal_length_setosa = petal_length(setosa_index,1);
figure(2);
scatter( petal_length_setosa , data_below , 'r' , 'filled');
axis([1 7 0 2.5]);
vline(2.5,'k');


% data_above
vericolor_index = find(labelVector == 1);
virginca_index = find(labelVector == 2);
petal_length_virginca = petal_length(virginca_index,1);
petal_length_vericolor = petal_length(vericolor_index,1);
figure(3);
scatter([petal_length_vericolor petal_length_virginca], data_above , 'r' , 'filled');
axis([1 7 0 2.5]);
vline(2.5,'k');

% ====================== END TEST8 ==============================