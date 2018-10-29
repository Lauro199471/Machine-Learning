clear;
for clc = 0:30
    disp(" ");
end

% sepal_length  sepal_width  petal_length petal_width species
%      1             2            3            4         5

data = csvread('iris.csv');

% ===== Testing =====

examplePoint = [5.1,3.5,1.4,0.2,0]

% Find Feature and where to cut off
potential_splits =  get_potential_splits(data);
[best_feature_value best_split_value] = determine_best_split(data , potential_splits);
[data_above data_below] = split_data(data , best_feature_value , best_split_value );


question = [ '? ' , num2str(best_feature_value) , ' <= ' , num2str(best_split_value) ];

% Find Answers(recursion)
yes_answers_label = "0";
no_answers_label = "? 3 <= 4.85";
 
C = {question , {yes_answers_label , no_answers_label} };

noAnsStr = C{1,2,1}{2};
%noAnsStrSplit = strsplit(noAnsStr);

yesAnsStr = C{1,2,1}{1};
%yesAnsStrSplit = strsplit(yesAnsStr);


questionList = strsplit(C{1}(1,:));

disp('Question');
disp(question);

disp('Yes:');
disp(yesAnsStr);

disp('No:');
disp(noAnsStr);

questionSplitValueStr = questionList{1,4};
questionFeatuValueStr = questionList{1,2};

questionSplitValue = str2double(questionSplitValueStr);
questionFeatuValueStr = str2num(questionFeatuValueStr);

if(questionList{1,1} == '?')
    
    exFeaValue = str2num(questionList{1,2});
    if(examplePoint(1 , exFeaValue) <= questionSplitValue)
        answer = yesAnsStr;
    else
        answer = noAnsStr;
    end
end

answerSplit = strsplit(answer);

if(answerSplit{1,1} == '?')
    % Repeat
    disp("Here");
else
    answerNum = str2num(answer);
    if( answerNum == 0)
        subTree = "Iris-Setosa"
    elseif( answerNum == 1)
        subTree = "Iris-versicolor"
    elseif( answerNum == 2)
        subTree = "Iris-virginica"
    end
end



