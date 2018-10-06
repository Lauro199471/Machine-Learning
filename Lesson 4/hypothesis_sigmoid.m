% A prediction function in logistic regression returns the 
% probability of our observation being positive, True, or “Yes”. 
% We call this class 1 and its notation is P(class=1). 
% As the probability gets closer to 1, our model is more confident 
% that the observation is in class 1.

% ===== Prediciton Function =====
% dataMatrix = M x N
% thetaVector = N x 1
% @return ypredictions = M x 1 , Returns M x 1 of predictions

function yPredictions = hypothesis_sigmoid(dataMatrix , thetaVector)  
  % Allocate Matrix
  yPredictions = zeros(size(dataMatrix,1),1); % M x 1 Matrix

  % Get Predictions: X * b = yPredictions
  yPredictions = dataMatrix * thetaVector; % (M x N) * (N x 1) = (M x 1)
  
  % Map any real number to the (0, 1) using Sigmoid Function
  for(i = 1:size(yPredictions,1))
    yPredictions(i) = 1 / (1 + exp(-1 * yPredictions(i)));
  end
return
end