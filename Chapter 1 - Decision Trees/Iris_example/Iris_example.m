clear;
for clc = 0:30
    disp(" ");
end

% sepal_length  sepal_width  petal_length petal_width species
%      1             2            3            4         5

data = csvread('iris.csv');


Tree = decision_tree_algorithm(data);
Tree

%A = cell2struct ({"Peter", "Hannah", "Robert";
%                   185, 170, 168} ,
%                 {"Name","Height"}, 1);

%B = {"Lauro" , [19 , 94]};
%C = {"Raider", [20 , 05]};
%B = [B ; C]

%C = [B ; C]
%counter = 1;
%D{counter,1} = "Paco"