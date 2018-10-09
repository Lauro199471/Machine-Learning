% A Hypothesis Function in logistic regression returns the 
% probability of our observation being positive, True, or “Yes”. 
% We call this class 1 and its notation is P(class=1). 
% As the probability gets closer to 1, our model is more confident 
% that the observation is in class 1.

% ===== hypothesis_function =====
% dataMatrix = M x N
% thetaVector = N x 1

% @return predictions = M x 1 , Returns M x 1 of predictions

function hX = hypothesis_function(dataMatrix , thetaVector)  
  b = dataMatrix * thetaVector; % (MxN) * (Nx1) = (M x 1)
  hX = 1 ./ (1 + exp(-b)); % hX = M x 1
return
end
