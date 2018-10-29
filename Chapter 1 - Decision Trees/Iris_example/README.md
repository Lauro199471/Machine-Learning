
| Label Name   | Label Value   |
|----|----|
| Iris-Setosa | 0 |
| Iris-Vericolor | 1 |
| Iris-Virginca | 2 |
# Plot Data
This function plots the Data Matrix

@params
* data : M x N Matrix , this is the data matrix
* xAxis : 1x1 , determines what feature should be in the X-Axis
* yAxis : 1x1 , determines what feature should be in the X-Axis
* xAxisName : string , name for X-Axis for plot
* yAxisName : string , name for Y-Axis for plot
* titleName : string , name for title for plot
```Matlab
function plotFeature(data,xAxis,yAixs,xAxisName,yAixsName,titleName)
  
  xAxisData = data(:,xAxis);
  yAixsData = data(:,yAixs);
  labelData = data(:,size(data,2));
  
  % Iris - Setosa
  setosa_index = find(labelData == 0); % find rows with label = 0
  petal_length_setosa = xAxisData(setosa_index,1);
  petal_width_setosa  = yAixsData(setosa_index,1);

  % Iris - Vericolor
  vericolor_index = find(labelData == 1);  % find rows with label = 1
  petal_length_vericolor = xAxisData(vericolor_index,1);
  petal_width_vericolor  = yAixsData(vericolor_index,1);
  
  % Iris - Virginca
  virginca_index = find(labelData == 2);  % find rows with label = 2
  petal_length_virginca = xAxisData(virginca_index,1);
  petal_width_virginca  = yAixsData(virginca_index,1);
  
  % Plot Data
  figure;
  scatter(petal_length_setosa , petal_width_setosa , 'r' , 'filled');
  hold on;
  scatter(petal_length_vericolor , petal_width_vericolor , 'g' , 'filled');
  hold on;
  scatter(petal_length_virginca , petal_width_virginca , 'b' , 'filled');
  xlabel(xAxisName);
  ylabel(yAixsName);
  title(titleName);
  
end
```
**Example**
```Matlab
data = csvread('iris.csv');
plotFeature(data,4,3,'Petal Width','Petal Length','Petal Leaves');
```
**Output**

![asdf](https://user-images.githubusercontent.com/13907836/47335200-f3b76900-d63e-11e8-83d0-0f391f34150e.png)

# Data Purity Check
This function checks how pure the label vector. 

@params
* data : M x N Matrix , this is the data matrix

@returns
* isPurity : 1 x 1 , returns if data is pure or not

```Matlab
function isPurity = check_purity(data)
  isPurity = 0;
  labelVector = data(: , size(data,2));

  [uniqueClasses uniqueClasses_counts] = uniqueness(labelVector);
  numOfLabel = length(uniqueClasses); % counts how many different values for label the data has
  
  if( numOfLabel == 1) % this means its pure , 1 class label
    isPurity = 1;
  else
    isPurity = 0;
  end
end
```

**Example**
```Matlab
data = csvread('iris.csv');
disp('Is data(150x5) pure?');
pureData = check_purity(data);
if(pureData == 1)
  disp('yes');
else
  disp('no');
end

disp('Is data(50x5) pure?');
pureData = check_purity(data(1:50,:));
if(pureData == 1)
  disp('yes');
else
  disp('no');
end
```
**Output**
```matlab
Is data(150x5) pure?
no
Is data(50x5) pure?
yes
```
# Uniqueness
This function gets the uniqueness of the data 

@params
* data : M x 1 Matrix , this is the data matrix

@returns
* uniqueClasses : M x 1 , returns the different values of data matrix
* uniqueClasses_counts : M x 1, returns how many of that value is in Data

```Matlab
function [uniqueClasses uniqueClasses_counts] = uniqueness(data)
  [uniqueClasses , B , ic] = unique(data);
  uniqueClasses_counts = accumarray(ic,1);
  
return
end
```

**Example**
iris-sample.csv

| Sepal Length   | Sepal Width   | Petal Length  | Petal Width  | Species |
|----|----|----|----|--------|
| 5.1 | 3.5 | 1.4 | 0.2 | 0 |
| 4.9 | 3.0 | 1.4 | 0.2 | 0 |
| 4.7 | 3.2 | 1.3 | 0.2 | 0 |
| 7.0 | 3.2 | 4.7 | 1.4 | 1 |
| 6.9 | 3.1 | 4.9 | 1.5 | 1 |
| 6.3 | 3.3 | 6.0 | 2.5 | 2 |
| 5.8 | 2.7 | 5.1 | 1.9 | 2 |
| 7.1 | 3.0 | 5.9 | 2.1 | 2 |
| 6.3 | 2.9 | 5.6 | 1.8 | 2 |

```Matlab
data = csvread('iris-sample.csv');
labelVector = data( : , size(data,2) );
[classes classCounts] = uniqueness(labelVector);
```
**Output**
```matlab
classes =

   0
   1
   2

classCounts =

   3
   2
   4
```
# Classify
This function returns which label class has the most in the label vector

@params
* data : M x N Matrix , this is the data matrix

@returns
* classification : 1 x 1 , returns which label class is most in data matrix

```Matlab
function classification = classify_data(data)
  ### MAKE SURE TO READ THE LABEL VECTOR ADD NEW LINE CODE ###
  
  #####################
  [uniqueClasses uniqueClasses_counts] = uniqueness(data);
  [valueMax classificationIndex] = max(uniqueClasses_counts);
  classification = uniqueClasses(classificationIndex);
  return
end
```

**Example**
```Matlab
data = csvread('iris-sample.csv');
mostLikey = classify_data(data);

if( mostLikey == 0)
    disp("Iris-Setosa");
elseif( mostLikey == 1)
    disp("Iris-versicolor");
elseif( mostLikey == 2)
    disp("Iris-virginica");
end
```
**Output**
```matlab
Iris-virginica
```

# Get Potential Splits
This function gets all the potential splits from the data matrix by taking unique values and finding the middle split

@params
* data : M x N Matrix , this is the data matrix

@returns
* hashMAP: a hash map of all the potential splits and features with Feature Number being Key and splits being the Value

```Matlab
function hashMAP =  get_potential_splits(data)
    nFeatures = size(data,2) - 1; % -1 because we dont need label

    for(column_index = 1 : nFeatures) % loop through rows
        column_value = data( : , column_index);
        [uniqueValues uniqueValues_counts] = uniqueness(column_value);

        for(row_index_uniqueValues = 1 : length(uniqueValues))
            if(row_index_uniqueValues > 1) % skip one cause no avarage
                currentValue = uniqueValues(row_index_uniqueValues);
                previosValue = uniqueValues(row_index_uniqueValues - 1);

                potential_split = (currentValue + previosValue ) / 2;
                split_values(row_index_uniqueValues - 1) = potential_split; % -1 cause we skip 1
            end
        end

        hashMAP.(int2str(column_index)) = split_values;
    end

return
end
```

**Example**
```Matlab
% 'y' - yellow
% 'm' - magenta
% 'c' - cyan
% 'r' - red
% 'g' - green
% 'b' - blue
% 'w' - white
% 'k' - black
% sepal_length  sepal_width  petal_length petal_width species
%      1             2            3            4         5
data = csvread('iris.csv');
splitMap = get_potential_splits(data);
petal_width = 4;

plotFeature(data,4,3,'Petal Width','Petal Length','Petal Leaves');
hold on;
vline(splitMap.(int2str(petal_width)),'k');
```
**Output**

![342ew](https://user-images.githubusercontent.com/13907836/47339942-9c6ec400-d651-11e8-9157-141158f7c4e0.PNG)

# Split Data
This function ...

@params
* ...

@returns
* ...

```Matlab
function [data_above data_below] = split_data(data , split_colm , split_value )
  nSamples = size(data , 1);
  split_data = data(: , split_colm);

  ptr1 = 1;
  ptr2 = 1;

  for(row_index = 1 : nSamples)
    if(split_data(row_index) <= split_value)
      below_index(ptr1,1) = ptr1;
      ptr1 = ptr1 + 1;
    else
      above_index(ptr2,1) = ptr2;
      ptr2 = ptr2 + 1;
    end
  end

  above_index = size(below_index,1) .+ above_index;
  
  for(below_index_i = 1 : size(below_index,1))
    data_below(below_index_i,:) = data(below_index(below_index_i) , :);
  end

  for(above_index_i = 1 : size(above_index,1))
    data_above(above_index_i,:) = data(above_index(above_index_i) , :);
  end

  return
end
```

**Example**
```Matlab
data = csvread('iris.csv');
split_colm = 4;
split_decision = 0.8;
[data_above data_below] = split_data(data , split_colm , split_decision )

data_below_length = data_below(:,3);
data_below_width  = data_below(:,4);
scatter(data_below_width , data_below_length , 'r' , 'filled');

hold on;

data_above_length = data_above(:,3);
data_above_width  = data_above(:,4);
scatter(data_above_width , data_above_length , 'b' , 'filled');

hold on;

vline(split_decision,'k');

xlabel('Petal Width');
ylabel('Petal Length');
title('Petal Leaves');
```
**Output**

![3e4r](https://user-images.githubusercontent.com/13907836/47339834-469a1c00-d651-11e8-8709-f7c155521f28.PNG)

# Calculate Entropy 
This function ...

@params
* ...

@returns
* ...

```Matlab
function entropy = calculate_entropy(data)
  
  labelColmIndex = size(data,2);
  labelColm = data(: , labelColmIndex);

  [uniqueClasses uniqueClasses_counts] = uniqueness(labelColm);
  
  probability = uniqueClasses_counts ./ sum(uniqueClasses_counts);
  
  for(index = 1 : size(probability,1))
    entropy(index,1) = probability(index) * log2(1 / probability(index));
  end
  
  entropy = sum(entropy);

return
end
```

**Example**
```Matlab
data = csvread('iris.csv');

% We know its going to be 0 because
% its only 1 class in label vector
entropy = calculate_entropy(data(1:50 , :))


% We know its going to be 1 because
% its only 2 class in label vector
entropy = calculate_entropy(data(50:150 , :))
```
**Output**
```Matlab
entropy = 0
entropy =  1.0
```

# Calculate OVERALL Entropy 
This function ...

@params
* ...

@returns
* ...

```Matlab
function overall_entropy = calculate_Overall_entropy(data_below , data_above)

    data_below_entropy = calculate_entropy(data_below);
    data_above_entropy = calculate_entropy(data_above);
    
    nSamples = size(data_above,1) + size(data_below,1);

    probalilityBelow = size(data_below,1) / nSamples;
    probalilityAbove = size(data_above,1) / nSamples;
    
    overall_entropy = (probalilityBelow * data_below_entropy) + (probalilityAbove * data_above_entropy);
    
end
```

**Example**
```Matlab
data = csvread('iris.csv');

split_colm = 4;
split_decision = 1.05;
[data_above data_below] = split_data(data , split_colm , split_decision );

overall_entropy = calculate_Overall_entropy(data_below , data_above)
```

**Output**
```Matlab
overall_entropy =  0.82167
```

# Determine Best Split
This function ...

@params
* ...

@returns
* ...

```Matlab
function [best_feature_value best_split_value] = determine_best_split(data , potential_splits)
    
    for [val, key] = potential_splits
        key;
    end
    
    % Find Initial Overall Entropy
    valueArray = potential_splits.(int2str(1));
    [data_above data_below] = split_data(data , 1 , valueArray(1) );
    overall_entropy = calculate_Overall_entropy(data_below , data_above);

    % Find Best Overall Entropy and return its value and feature numbers
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
```

**Example**
```Matlab
data = csvread('iris.csv');

potential_splits =  get_potential_splits(data);

[x y] = determine_best_split(data , potential_splits);

plotFeature(data,4,3,'Petal Width','Petal Length','Petal Leaves');
hold on;
vline(y,'k');
```

**Output**
```Matlab
overall_entropy =  0.82167
```


# Decision Tree Algorithm
This function ...

@params
* ...

@returns
* ...

```Matlab
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
```

**Example**
```Matlab
data = csvread('iris.csv');

Tree = decision_tree_algorithm(data);

disp(Tree);
```

**Output**
```Matlab
Petal Width <= 0.8 ? [Iris-Setosa , 
  Petal Length <= 4.85 ? [Iris-versicolor , 
    Petal Width <= 1.35 ? [Iris-versicolor , Iris-virginica]]]
```

![irisdiagram](https://user-images.githubusercontent.com/13907836/47599880-5de84a80-d96c-11e8-8ae4-75a583cb3f91.jpeg)
