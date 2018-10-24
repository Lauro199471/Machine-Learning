data = csvread('iris.csv');
[x y] = determine_best_split(data);

 [uniqueClasses uniqueClasses_counts] = uniqueness(data(:,1))
 
 x
 y