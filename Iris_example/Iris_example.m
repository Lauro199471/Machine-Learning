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
disp(question);


% Find Answers(recursion)
if(check_purity(data_below) == 1)
  disp('This is Pure');
end

if(check_purity(data_above) == 1)
  disp('This is Pure');
end
