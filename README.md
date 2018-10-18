# Machine-Learning
Example Code for Machine Learning

# Testing
This function gets data from 

https://dillinger.io/
https://www.tablesgenerator.com/markdown_tables

gets_potential_splits.m
```Matlab
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
```

main.m
```Matlab

```

| Sepal Length   | Sepal Width   | Petal Length  | Petal Width  | Species |
|----|----|----|----|--------|
| 5.1 | 3.5 | 1.4 | 0.2 | 0 |
| 4.9 | 3.0 | 1.4 | 0.2 | 0 |
| 4.7 | 3.2 | 1.3 | 0.2 | 0 |
| 7.0 | 3.2 | 4.7 | 1.4 | 1 |
| 6.4 | 3.2 | 4.5 | 1.5 | 1 |
| 6.9 | 3.1 | 4.9 | 1.5 | 1 |
| 6.3 | 3.3 | 6.0 | 2.5 | 2 |
| 5.8 | 2.7 | 5.1 | 1.9 | 2 |
| 7.1 | 3.0 | 5.9 | 2.1 | 2 |
