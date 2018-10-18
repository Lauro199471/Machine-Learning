% sepal_length sepal_width petal_length petal_width species
function plotFeature(featureMatrix,label)
  
  sepal_length = featureMatrix(:,1);
  sepal_width  = featureMatrix(:,2);
  
  petal_length = featureMatrix(:,3);
  petal_width  = featureMatrix(:,4);
  
  % Iris - Setosa
  setosa_index = find(label == 0);
  petal_length_setosa = petal_length(setosa_index,1);
  petal_width_setosa  = petal_width(setosa_index,1);

  % Iris - Vericolor
  vericolor_index = find(label == 1);
  petal_length_vericolor = petal_length(vericolor_index,1);
  petal_width_vericolor  = petal_width(vericolor_index,1);
  
  % Iris - Virginca
  virginca_index = find(label == 2);
  petal_length_virginca = petal_length(virginca_index,1);
  petal_width_virginca  = petal_width(virginca_index,1);
  
  % Plot Data
  figure;
  scatter(petal_width_setosa , petal_length_setosa , 'r' , 'filled');
  
  hold on;
  scatter(petal_width_vericolor , petal_length_vericolor , 'g' , 'filled');
  
  hold on;
  scatter(petal_width_virginca , petal_length_virginca , 'b' , 'filled');
  
  xlabel('Petal Width');
  ylabel('Petal Length');
  title('Petal Leaves');
end