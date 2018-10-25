data = csvread('iris.csv');

[x y] = determine_best_split(data);

plotFeature(data,4,3,'Petal Width','Petal Length','Petal Leaves');
hold on;
vline(y,'k');