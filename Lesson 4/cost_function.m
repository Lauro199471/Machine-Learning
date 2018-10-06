% cost function to measure how close the predicted values are to their corresponding real values.

% ===== Cost Function =====
% Using Mean Absolute Error
% dataMatrix = M x N
% yValuesMatrix = M x 1
% thetaVector = N x 1
% @return J = 1 x 1 , Returns 1D matrix of predictions

function J = cost_function(dataMatrix , yValuesMatrix , thetaVector)
  observations = size(dataMatrix,1); % Get number of Rows;bascially how many data sets do we have?
  
  predictions = predict(dataMatrix,thetaVector);% (M x 1)
  hx = predict(dataMatrix,thetaVector);% (M x 1)

  y = yValuesMatrix;

  #Take the error when label=1 ; y*-log(h(0)) 
  class1_cost = (y * transpose(-1 * log(predictions)));% (Mx1)*(1xM) = (MxM)
 
  #Take the error when label=0 ; (1-y)*-log(h(0))  
  class2_cost = (1-yValuesMatrix) * transpose(-1 * log(1-predictions));

  J = (-y' * log(hx) - (1 - y')*log(1 - hx)) / observations;
  
  #Take the sum of both costs
  %cost = class1_cost - class2_cost;
  #Take the average cost
  %cost_z = sum(cost)/observations;

return
end