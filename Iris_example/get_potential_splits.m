function containerSplit =  get_potential_splits(data)
    containerSplit = containers.Map;

    nFeatures = size(data,2) - 1; % -1 because we dont need label
    for(column_index = 1 : nFeatures)
        column_value = data( : , column_index);
        [uniqueValues uniqueValues_counts] = uniqueness(column_value);

        for(row_index_uniqueValues = 1 : length(uniqueValues))
            if(row_index_uniqueValues > 1)
                currentValue = uniqueValues(row_index_uniqueValues);
                previosValue = uniqueValues(row_index_uniqueValues - 1);

                potential_split = (currentValue + previosValue ) / 2;
                split_values(row_index_uniqueValues - 1) = potential_split; % -1 cause we skip 1
            end
        end

        containerSplit(int2str(column_index)) = split_values;
    end

return
end