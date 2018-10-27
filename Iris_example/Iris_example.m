% sepal_length  sepal_width  petal_length petal_width species
%      1             2            3            4         5

data = csvread('iris.csv');

%data = data(1:100 , : );

subTree = decision_tree_algorithm(data);

disp(subTree);