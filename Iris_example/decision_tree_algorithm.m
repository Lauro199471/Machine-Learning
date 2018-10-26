function classification = decision_tree_algorithm(data)

    % Base Case
    if(check_purity(data) == 1)
        disp('This is Pure');
        classification = classification = classify_data(data)
    else
        disp('This is not pure');

        potential_splits =  get_potential_splits(data);
        [best_feature_value best_split_value] = determine_best_split(data , potential_splits);
        [data_above data_below] = split_data(data , best_feature_value , best_split_value );
        classification = data_below
    end

end