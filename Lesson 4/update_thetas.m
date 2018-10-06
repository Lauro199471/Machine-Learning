% To minimize our cost, we use Gradient Descent

% ==== Update Thetas ====
% Vectorized Gradient Descent
% dataMatrix     = M x N
% thetaVector    = N x 1
% learning_rate  = 1 x 1
% @return thetas = N x 1 , Returns 1D matrix of predictions

function thetas = update_thetas(dataMatrix , yValuesMatrix , thetaVector , learning_rate)
  N = size(dataMatrix,1);
  thetas = thetaVector;
  
  % 1 - Get Predictions
  predictions = predict(dataMatrix,thetaVector);
  
  % 2 - Transpose features from (100, 3) to (3, 100) [1 c0 c1]
  % So we can multiply w the (100,1)  cost matrix.
  % Returns a (3,1) matrix holding 3 partial derivatives --
  % one for each feature -- representing the aggregate
  % slope of the cost function across all observations
  gradient = transpose(dataMatrix) * (predictions - yValuesMatrix);

  % 3 - Take the average cost derivative for each feature
  gradient = gradient / N;
 
  % 4 - Multiply the gradient by our learning rate
  gradient = gradient * learning_rate;
  
  %5 - Subtract from our weights to minimize cost
  thetas = thetas - gradient;

return
end