% cost function to measure how close the predicted values are to their corresponding real values.

% ===== Cost Function =====
% dataMatrix = M x N
% yValuesMatrix = M x 1
% thetaVector = N x 1

% @return jCost = 1 x 1

function [J , grad] = cost_function(dataMatrix, yValuesMatrix)
  M = size(dataMatrix,1); % Get Number of Data Sets

  % Add the 1's Col. to the Data Set 
  % Xo = 1 , X1 = Studied Hours , X2 = Slept Hours
  oneCol = (ones(size(dataMatrix,1),1));
  data_Matrix = [oneCol,dataMatrix];

  % initial theta values 
  theta_Vector = (zeros(size(data_Matrix,2),1)); % (N x 1)
  
  % Get Prediction aka Hypothesis
  hx = hypothesis_function(data_Matrix, theta_Vector); % M x 1

  % Calculate Cost
  Y = yValuesMatrix;
  J = -(1 / M) * sum( (Y .* log(hx)) + ((1 - Y) .* log(1-hx)) );
  
  % Get Gradient
  X = data_Matrix;
  grad = zeros(size(theta_Vector,1),1);
  for(i = 1:size(theta_Vector,1) ) % 1 ~ N
    grad(i) = (1/M) * sum( transpose(hx-Y) * X(:,i) );
  end
  return
end
