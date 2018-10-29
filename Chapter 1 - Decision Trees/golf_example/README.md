
|  Play / DontPlay   | Label Value   |
|----|----|
| Don't Play | 0 |
| Play | 1 |

| Outlook | Temperature | Humidity  | Windy  | Play / DontPlay |
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
| 7.1 | 3.0 | 5.9 | 2.1 | 2 |
| 7.1 | 3.0 | 5.9 | 2.1 | 2 |
| 7.1 | 3.0 | 5.9 | 2.1 | 2 |
| 7.1 | 3.0 | 5.9 | 2.1 | 2 |
| 7.1 | 3.0 | 5.9 | 2.1 | 2 |

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
