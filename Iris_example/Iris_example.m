data = csvread('iris.csv');

data = data(1:100 , : );

potential_splits =  get_potential_splits(data);
[best_feature_value best_split_value] = determine_best_split(data , potential_splits);
[data_above data_below] = split_data(data , best_feature_value , best_split_value );

best_feature_valueS = ' ';
if( best_feature_value == 1)
    best_feature_valueS = "sepal_length";
elseif( best_feature_value == 2)
    best_feature_valueS = "sepal_width";
elseif( best_feature_value == 3)
    best_feature_valueS = "petal_length";
elseif( best_feature_value == 4)
    best_feature_valueS = "petal_width";
end

question = [ best_feature_valueS , ' <= ' , num2str(best_split_value) ];


% Find Answers(recursion)
if(check_purity(data_below) == 1)
  disp('Yes Values is Pure');
end

if(check_purity(data_above) == 1)
  disp('No Values is Pure');
end

dataBelowa = classify_data(data_below);
if( dataBelowa == 0)
    dataBelow = "Iris-Setosa";
elseif( dataBelowa == 1)
    dataBelow = "Iris-versicolor";
elseif( dataBelowa == 2)
    dataBelow = "Iris-virginica";
end

dataAbovea = classify_data(data_above);
if( dataAbovea == 0)
    dataAbove = "Iris-Setosa";
elseif( dataAbovea == 1)
    dataAbove = "Iris-versicolor";
elseif( dataAbovea == 2)
    dataAbove = "Iris-virginica";
end

subtree = [ question , " ? [" , dataBelow , " , " , dataAbove , "]"];

subtree
