% ===== Cost Function =====
function cost_z = cost_function(dataMat,coefficientVector,yValuesMat)
  observations = size(dataMat,1); % Get number of Rows;bascially how many data sets do we have?
  predictions = predict(dataMat,coefficientVector);
  #Take the error when label=1 ; y*-log(h(0)) 
  class1_cost = yValuesMat * (-1 * log(predictions));
  #Take the error when label=0 ; (1-y)*-log(h(0)) 
  class2_cost = (1-yValuesMat) * (-1 * log(1-predictions));

  #Take the sum of both costs
  cost = class1_cost - class2_cost;
  #Take the average cost
  cost_z = sum(cost)/observations;

return
end