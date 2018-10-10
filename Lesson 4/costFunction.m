% cost function to measure how close the predicted values 
% are to their corresponding real values.

% ===== Cost Function =====
% X = M x N
% w = M x 1
% y = N x 1

% @return jCost = 1 x 1

function J = costFunction(X , w , y , hx)

  nSample = size(X,1); 

  % Calculate Cost;
  J = -(1 / nSample) * sum( (y .* log(hx)) + ((1 - y) .* log(1-hx)) );
  
return
end
