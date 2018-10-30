function tree = decision_tree_algorithm(data)
    global counterLevel = 0
    % Is Data pure?
    if(check_purity(data) == 1)
        % return Label Class
        tree = num2str(classify_data(data));

    % else return Tree
    else
        potential_splits =  get_potential_splits(data);
        [best_feature_value best_split_value] = determine_best_split(data , potential_splits);
        [data_above data_below] = split_data(data , best_feature_value , best_split_value );

        question = ['? ' ,num2str(best_feature_value) , ' <= ' , num2str(best_split_value) ];
        questionNode = {question , ["" , ""]};

        yes_answers_label = getSubTree(data_below)
        no_answers_label  = getSubTree(data_above)

        questionNode{1,2,1}{1} = yes_answers_label;
        questionNode{1,2,1}{2} = no_answers_label;

        % If there is Question Node Repeat
        yesSplit = strsplit(yes_answers_label)
        noSplit = strsplit(no_answers_label)
        if(yesSplit{1,1} == '?')
            disp('Yes got a question');
        elseif(noSplit{1,1} == '?')
            disp('No got a question');
        end
        
        tree = questionNode;
    end
end