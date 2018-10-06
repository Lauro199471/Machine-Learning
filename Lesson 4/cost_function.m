% cost function to measure how close the predicted values are to their corresponding real values.

% ===== Cost Function =====
% Using Mean Absolute Error
% dataMatrix = M x N
% yValuesMatrix = M x 1
% thetaVector = N x 1
% @return cost_z = M x 1 , Returns 1D matrix of predictions

function cost_z = cost_function(dataMatrix , yValuesMatrix , thetaVector)
  observations = size(dataMatrix,1); % Get number of Rows;bascially how many data sets do we have?
  predictions = predict(dataMatrix,thetaVector);
  #Take the error when label=1 ; y*-log(h(0)) 
  class1_cost = yValuesMatrix * (-1 * log(predictions));
  #Take the error when label=0 ; (1-y)*-log(h(0)) 
  class2_cost = (1-yValuesMatrix) * (-1 * log(1-predictions));

  #Take the sum of both costs
  cost = class1_cost - class2_cost;
  #Take the average cost
  cost_z = sum(cost)/observations;

return
end