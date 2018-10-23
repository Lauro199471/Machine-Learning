% 'y' - yellow
% 'm' - magenta
% 'c' - cyan
% 'r' - red
% 'g' - green
% 'b' - blue
% 'w' - white
% 'k' - black");
% ========== Main ===========
% Load and Prepare Data
data = csvread('iris.csv');
splitMap = get_potential_splits(data);
petal_width = 4;

plotFeature(data,4,3,'Petal Width','Petal Length','Petal Leaves');

