clear;
for clc = 0:30
    disp(" ");
end

% sepal_length  sepal_width  petal_length petal_width species
%      1             2            3            4         5

data = csvread('iris.csv');

%Tree = decision_tree_algorithm(data);

%disp(Tree);

% ===== Testing =====

str1 = "Hello World"; 
C = strsplit(str1);




% ===== Testing =====

% Find Feature and where to cut off
potential_splits =  get_potential_splits(data);
[best_feature_value best_split_value] = determine_best_split(data , potential_splits);
[data_above data_below] = split_data(data , best_feature_value , best_split_value );


question = [ num2str(best_feature_value) , ' <= ' , num2str(best_split_value) ];
question

% Find Answers(recursion)
yes_answers_label = "1";
no_answers_label = "5 <= 8.0";
 
C = {question ,{yes_answers_label , no_answers_label} }
sdf = C{1,2}(2)
questionList = strsplit(C{1}(1,:))
%tree = {'1' , [best_feature_value , best_split_value , yes_answers_label , no_answers_label]};
%tree
%question = [num2str(tree{1,2}(1)) , ' <= ' , num2str(tree{1,2}(2))];
%question
%question = [num2str(best_feature_value) , ' <= ' , num2str(best_split_value)];
%question
%key = question;
%values = {yes_answers_label, no_answers_label}
%map = containers.Map(key,values)
%map('Mon')

%C = {'ONE',[56 67 78]};
%disp(" ");
%C(2,:) = {'TWO',[58 69 79]};
%disp(" ");
%C(3,:) = {'THREE',[60 68 81]};
%disp(" ");
%C(3,:) = {'FOUR',65};
%C
%disp(" ");
%disp(" ");
%C{2,2}(2)