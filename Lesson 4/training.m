% Training a model is the process of iteratively improving your prediction 
% equation by looping through the dataset multiple times, each time 
% updating the weight and bias values in the direction indicated by 
% the slope of the cost function (gradient). 

% ===== Training Function =====
% dataMatrix = M x N
% yValuesMatrix = M x 1
% thetaVector = N x 1
% learning_rate  = 1 x 1
% iter = 1 x 1
function [thetas  cost_history] = train(dataMatrix , yValuesMatrix , thetaVector , learning_rate , iter)
  cost_history = yValuesMatrix; % Allocate Matrix
  
  for(i = 1 : iterations)
    thetas = update_thetas(dataMatrix , yValuesMatrix , thetaVector , learning_rate);
    
    % Calculate error for auditing purposes
    cost = cost_function(dataMatrix , yValuesMatrix , thetaVector);
    cost_history(i) = cost;
  end

return
end