% A prediction function in logistic regression returns the 
% probability of our observation being positive, True, or “Yes”. 
% We call this class 1 and its notation is P(class=1). 
% As the probability gets closer to 1, our model is more confident 
% that the observation is in class 1.

% ===== Prediciton Function =====
% dataMatrix = M x N
% thetaVector = N x 1
% @return predictions = M x 1 , Returns 1D array of predictions

function predictions = predict(dataMatrix , thetaVector)  
  z = dataMatrix * thetaVector; % (M x N) * (N x 1) = (M x 1)
  predictions = (1 / (1 + exp(-1*z)) );
  
  % Transposing cause returns 1xM , I need Mx1
  predictions = transpose(predictions);
return
end