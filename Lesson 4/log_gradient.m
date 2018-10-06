% To minimize our cost, we use Gradient Descent
%  algorithm used to find the values of parameters (coefficients) 
%  of a function (f) that minimizes a cost function (cost).

% ==== log_gradient ====
% Vectorized Gradient Descent
% dataMatrix     = M x N
% yValuesMatrix  = M x 1
% thetaVector    = N x 1
% @return theta  = N x 1

function thetas = log_gradient(dataMatrix , yValuesMatrix , thetaVector) 
  % Logistic Gradient function 

  % difference = h(0) - y
  predictions = hypothesis_sigmoid(dataMatrix , thetaVector);
  actual_Values = yValuesMatrix;
  difference = predictions - actual_Values; % M x 1

  % difference * X
  thetas =  transpose(difference) * dataMatrix; % 1 x M * M x N = 1 x N
  thetas = transpose(thetas); % N x 1
return
end