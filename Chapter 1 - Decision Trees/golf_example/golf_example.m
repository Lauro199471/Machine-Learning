data = csvread('golf.csv');

% ====== 1st Lesson ======
disp('');
disp('Lesson 1');
disp('Is data(14x5) pure?');
pureData = check_purity(data);
if(pureData == 1)
  disp('yes');
else
  disp('no');
end

disp('Is data(2x5) pure?');
pureData = check_purity(data(1:2,:));
if(pureData == 1)
  disp('yes');
else
  disp('no');
end
% =====================================

% ====== 2nd Lesson ======
disp('');
disp('Lesson 2');
labelVector = data( : , size(data,2) );
[classes classCounts] = uniqueness(labelVector);
classes
classCounts
% =====================================

% ====== 3rd Lesson ======
disp('');
disp('Lesson 3');
mostLikey = classify_data(data);

disp('mostLikey:');
if( mostLikey == 0)
    disp("Dont Play");
elseif( mostLikey == 1)
    disp("Play");
end

% =====================================

% ====== 4th Lesson ======
disp('');
disp('Lesson 4');
splitMap = get_potential_splits(data);
splitMap

% =====================================

% ====== 5th Lesson ======
disp('');
disp('Lesson 5');
entropy = calculate_entropy(data(1:2 , :))

% =====================================

% ====== 6th Lesson ======
disp('');
disp('Lesson 6');
potential_splits =  get_potential_splits(data);

[best_feature_value best_split_value] = determine_best_split(data , potential_splits);
best_feature_value
best_split_value
% =====================================

disp('');
disp('');
disp('');
Tree = decision_tree_algorithm(data);

disp(Tree);
