function [sepal_length_splits sepal_width_splits petal_length_splits petal_width_splits] =  get_potential_splits(data)
    % Sepal Length Splits
    valuesFeature = data(:,1);
    [uniqueValues uniqueValues_counts] = uniqueness(valuesFeature);
    
    % Get Split of 2 points by adding and dividing by 2 for midway split
    for(index = 1 : length(uniqueValues))
        if(index > 1)
            currentValue = uniqueValues(index);
            previosValue = uniqueValues(index - 1);

            potential_split = (currentValue + previosValue ) / 2;
            sepal_length_splits(index-1) = potential_split; % -1 cause we skip 1
        end
    end

    % Sepal Width Splits
    valuesFeature = data(:,2);
    [uniqueValues uniqueValues_counts] = uniqueness(valuesFeature);
    
    % Get Split of 2 points by adding and dividing by 2 for midway split
    for(index = 1 : length(uniqueValues))
        if(index > 1)
            currentValue = uniqueValues(index);
            previosValue = uniqueValues(index - 1);

            potential_split = (currentValue + previosValue ) / 2;
            sepal_width_splits(index-1) = potential_split; % -1 cause we skip 1
        end
    end

    % Petal Length Splits
    valuesFeature = data(:,3);
    [uniqueValues uniqueValues_counts] = uniqueness(valuesFeature);
    
    % Get Split of 2 points by adding and dividing by 2 for midway split
    for(index = 1 : length(uniqueValues))
        if(index > 1)
            currentValue = uniqueValues(index);
            previosValue = uniqueValues(index - 1);

            potential_split = (currentValue + previosValue ) / 2;
            petal_length_splits(index-1) = potential_split; % -1 cause we skip 1
        end
    end

    % Petal Width Splits
    valuesFeature = data(:,4);
    [uniqueValues uniqueValues_counts] = uniqueness(valuesFeature);
    
    % Get Split of 2 points by adding and dividing by 2 for midway split
    for(index = 1 : length(uniqueValues))
        if(index > 1)
            currentValue = uniqueValues(index);
            previosValue = uniqueValues(index - 1);

            potential_split = (currentValue + previosValue ) / 2;
            petal_width_splits(index-1) = potential_split; % -1 cause we skip 1
        end
    end
end