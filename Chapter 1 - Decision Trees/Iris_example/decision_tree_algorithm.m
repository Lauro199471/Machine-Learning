function [treeMapt tree_or_leaf] = decision_tree_algorithm(data)
    global treeMap = containers.Map('KeyType','char','ValueType','char');
    

    tree_or_leaf = "?";
    global counter = 0;
    % Is Data pure?
    if(check_purity(data) == 1)
        % return Label Class
        classification = classify_data(data);
        if( classification == 0)
            tree_or_leaf = "Iris-Setosa";
        elseif( classification == 1)
            tree_or_leaf = "Iris-versicolor";
        elseif( classification == 2)
            tree_or_leaf = "Iris-virginica";
        end

    % else return Tree
    else
        potential_splits =  get_potential_splits(data);
        [best_feature_value best_split_value] = determine_best_split(data , potential_splits);
        [data_above data_below] = split_data(data , best_feature_value , best_split_value );
        
       
       
        question = [num2str(best_feature_value) , ' <= ' , num2str(best_split_value) ];
        
        [x,yes_answer] = decision_tree_algorithm(data_below);
        [y,no_answer] = decision_tree_algorithm(data_above);
        
        
        disp('=============S');
        counter = counter + 1;
        yes_answer
        no_answer
        question = [num2str(counter)," ",  question];
        counter

        values =  [yes_answer;no_answer];
        treeMapTemp = containers.Map('KeyType','char','ValueType','char');
        treeMapTemp(question) = values;

        if(counter == 1) % bottom
            treeMap = treeMapTemp;
        else
            treeMap = [treeMapTemp treeMap];
        end

        keys(treeMapTemp)
        
        disp('=============E');

    end
    
    treeMapt = treeMap;
end