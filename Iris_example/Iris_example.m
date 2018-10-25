data = csvread('iris.csv');

potential_splits =  get_potential_splits(data);

[x y] = determine_best_split(data , potential_splits);

plotFeature(data,4,3,'Petal Width','Petal Length','Petal Leaves');
hold on;
vline(y,'k');