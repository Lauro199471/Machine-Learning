function [stringLabel subTree] = decision_tree_algorithm(data)

    % Is Data pure?
    if(check_purity(data) == 1)
        disp('This is Pure');
        classification = classify_data(data)
        
        stringLabel = " ";
        if( classification == 0)
            stringLabel = "Iris-Setosa";
        elseif( classification == 1)
            stringLabel = "Iris-versicolor";
        elseif( classification == 2)
            stringLabel = "Iris-virginica";
        end
    
    % If not then find pure
    else
        disp('This is not pure');

        potential_splits =  get_potential_splits(data);
        [best_feature_value best_split_value] = determine_best_split(data , potential_splits);
        [data_above data_below] = split_data(data , best_feature_value , best_split_value );

        question = [ num2str(best_feature_value) , ' <= ' , num2str(best_split_value) ];
        
        % Find Answers(recursion)
        [yes_answers idc]= decision_tree_algorithm(data_below);
        [no_answers IDC]= decision_tree_algorithm(data_above);
        
        StringYesNo = [yes_answers,' ',no_answers];

        subTree = [question StringYesNo];

    end

end