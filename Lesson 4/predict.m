% A prediction function in logistic regression returns the 
% probability of our observation being positive, True, or “Yes”. 
% We call this class 1 and its notation is P(class=1). 
% As the probability gets closer to 1, our model is more confident 
% that the observation is in class 1.

% ===== Prediciton Function =====
% dataMatrix = M x N
% thetaVector = N * 1
% @return prob_z = M * 1 , Returns 1D array of probabilities

function prob_z = predict(dataMatrix , thetaVector)  
  z = dataMatrix * thetaVector;
  prob_z = (1 / (1+exp(-1*z)));
return
end