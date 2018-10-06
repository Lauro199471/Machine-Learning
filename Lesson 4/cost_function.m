% cost function to measure how close the predicted values are to their corresponding real values.

% ===== Cost Function =====
% Using Mean Absolute Error
% dataMatrix = M x N
% yValuesMatrix = M x 1
% thetaVector = N x 1
% @return J = 1 x 1 , Returns 1D matrix of predictions

function J = cost_function(dataMatrix , yValuesMatrix , thetaVector)
  % Allocate Matrix
  cost = zeros(size(dataMatrix,1),1); % M x 1 Matrix

  observations = size(dataMatrix,1); % Get number of Rows;bascially how many data sets do we have?
  
  hx = predict(dataMatrix,thetaVector);% (M x 1)

  y = yValuesMatrix;

  # Find Errors
  for(i = 1 : size(cost,1) )
    cost(i) = ( (y(i) * log(hx(i)) ) + ( (1 - y(i))*log(1 - hx(i))) );
  end

  # Sum Error
  J = 0;
  for(i = 1 : size(cost,1) )
    J = J + cost(i);
  end

  # Divide By number of Oberservations
  J = J / observations;
  
return
end