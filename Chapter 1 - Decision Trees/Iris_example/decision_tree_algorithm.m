function subTree = decision_tree_algorithm(data)

    subTree = " ";

    % Is Data pure?
    if(check_purity(data) == 1)
        % return Label Class
        classification = classify_data(data);
        
        if( classification == 0)
            subTree = "Iris-Setosa";
        elseif( classification == 1)
            subTree = "Iris-versicolor";
        elseif( classification == 2)
            subTree = "Iris-virginica";
        end
    
    % If not then find pure
    else
        % Find Feature and where to cut off
        potential_splits =  get_potential_splits(data);
        [best_feature_value best_split_value] = determine_best_split(data , potential_splits);
        [data_above data_below] = split_data(data , best_feature_value , best_split_value );

        % sepal_length  sepal_width  petal_length petal_width species
        %      1             2            3            4         5
        
        bestFeature ="";
        if(best_feature_value == 1)
            bestFeature = 'Sepal Length';
        elseif(best_feature_value == 2)
            bestFeature = 'Sepal Width';
        elseif(best_feature_value == 3)
            bestFeature = 'Petal Length';
        elseif(best_feature_value == 4)
            bestFeature = 'Petal Width';
        end

        question = [ bestFeature , ' <= ' , num2str(best_split_value) ];
        
        % Find Answers(recursion)
        yes_answers_label = decision_tree_algorithm(data_below);
        no_answers_label  = decision_tree_algorithm(data_above);
                
        StringYesNo = [yes_answers_label," , ",no_answers_label];
        subTree = [question , " ? [" , StringYesNo "]"];

    end

end