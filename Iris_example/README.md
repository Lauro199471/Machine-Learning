
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
This function ...

@params
* ...

@returns
* ...

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
![screenshot from 2018-10-22 21-08-39](https://user-images.githubusercontent.com/13907836/47335161-bd79e980-d63e-11e8-9e54-c433a7ff66aa.png)
