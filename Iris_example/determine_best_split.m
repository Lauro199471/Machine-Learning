function [potential_splits best_split_value] = determine_best_split(data)
    overall_entropy = 9999;

    potential_splits =  get_potential_splits(data);

    for [val, key] = potential_splits
        key;
    end

    for(keyIndex = 1 : 1)%str2num(key))% Loop through all keys 
        valueLength = size(potential_splits.(int2str(keyIndex)) , 2)
        valueArray = potential_splits.(int2str(keyIndex))
        for(valueIndex = 1 : valueLength) % Loop through all values
            [data_above data_below] = split_data(data , keyIndex , valueArray(10) );
    end

    potential_splits = data_above;
    best_split_value = data_below;
return
end