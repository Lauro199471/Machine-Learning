function [best_split_column best_split_value] = determine_best_split(data , potential_splits)
    overall_entropy = 9999;

    colmun_index = 1;

    for (key_index = keys(potential_splits)) 

        thekey = key_index{1};
        potential_splits_values = potential_splits(thekey);

        for(value_index = 1 : size(potential_splits_values,2))
        [data_above data_below] = split_data(data , colmun_index , 1.05);
    end

    best_split_column = 0;
    best_split_value  = 0;

return
end