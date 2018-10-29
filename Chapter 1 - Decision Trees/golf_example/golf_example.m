data = csvread('golf.csv');

Tree = decision_tree_algorithm(data);

disp(Tree);