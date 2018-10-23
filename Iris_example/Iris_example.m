data = csvread('iris.csv');
splitMap = get_potential_splits(data);
petal_width = 4;

plotFeature(data,4,3,'Petal Width','Petal Length','Petal Leaves');
hold on;
vline(splitMap.(int2str(petal_width)),'k');