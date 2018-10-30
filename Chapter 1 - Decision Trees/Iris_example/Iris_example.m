clear;
for clc = 0:30
    disp(" ");
end

% sepal_length  sepal_width  petal_length petal_width species
%      1             2            3            4         5

data = csvread('iris.csv');


[Tree,x] = decision_tree_algorithm(data);
disp(" ");
disp(" ");
keys(Tree)
disp(" ");
disp(" ");
a = values(Tree)

%no = a{1}(2,:);
%yes = a{1}(1,:);

%keys = {'Jan', 'Feb'};
%values = {[327.2, 368.2],[23,24]};

%rainfallMap = containers.Map(keys, values);


%keys = {'Mar', 'Jun'};
%values = {[654, 5456],[654,54]};

%rainfallMapw = containers.Map(keys, values);
%treeMap = containers.Map('KeyType','char','ValueType','char');
%M = [rainfallMap rainfallMapw]
%M('Mar')
treeMap = containers.Map('KeyType','char','ValueType','char');
values =  ['9996';'324'];
treeMap('4 <= 1.35') = values;
treeMap('4 <= 1.35');

question = [num2str(34) , ' <= ' , num2str(3) ];