% To minimize our cost, we use Gradient Descent

% ==== Update Thetas ====
% Vectorized Gradient Descent
% dataMatrix     = M x N
% yValuesMatrix  = M x 1
% thetaVector    = N x 1
% learning_rate  = 1 x 1
% @return thetas = N x 1 , Returns 1D matrix of predictions

function thetas = update_thetas(dataMatrix , yValuesMatrix , thetaVector , learning_rate)
  N = size(dataMatrix,1); % get row length
  thetas = thetaVector;
  
  % 1 - Get Predictions(M x 1)
  predictions = predict(dataMatrix,thetaVector);
  
  % 2 - Transpose dataMatrix from (100, 3) to (3, 100) [1 o0 o1]
  % So we can multiply theats the (100,3)  cost matrix.
  % Returns a (3,1) matrix holding 3 partial derivatives --
  % one for each feature -- representing the aggregate
  % slope of the cost function across all observations

  % (N x M) * (Mx1-Mx1) = (Nx1)
  gradient = transpose(dataMatrix) * (predictions - yValuesMatrix);

  % 3 - Take the average cost derivative for each feature
  gradient = gradient / N;
 
  % 4 - Multiply the gradient by our learning rate
  gradient = gradient * learning_rate;
  
  %5 - Subtract from our weights to minimize cost
  thetas = thetas - gradient;

return
end