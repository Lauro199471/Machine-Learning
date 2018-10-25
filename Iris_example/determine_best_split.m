function [best_feature_value best_split_value] = determine_best_split(data)
    overall_entropy = 9999;

    potential_splits =  get_potential_splits(data);

    for [val, key] = potential_splits
        key;
    end

    for(col_Index = 1 : str2num(key)) % Loop through all keys 
        
        valueLength = size(potential_splits.(int2str(col_Index)) , 2);
        valueArray = potential_splits.(int2str(col_Index));

        for(rowIndex = 1 : valueLength) % Loop through all values

            [data_above data_below] = split_data(data , col_Index , valueArray(rowIndex) );
            test_overall_entropy = calculate_Overall_entropy(data_below , data_above);

            if(test_overall_entropy <= overall_entropy)

                overall_entropy = test_overall_entropy;
                best_feature_value = col_Index;
                best_split_value = valueArray(rowIndex);
    
            end
        end
    end

return
end