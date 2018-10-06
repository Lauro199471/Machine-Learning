% =====  Gradient Descent Function =====
% @param
% data_Matrix = M x N
% y_vector = M x 1
% theta_Vector = N x 1
% learning_rate = 1 x 1
% iter = 1 x 1

% @return 
% predictions = M x 1 , Returns 1D array of predictions

function theta = grad_desc(data_Matrix , y_vector , theta_Vector , learning_rate,iter)  
  cost = cost_function(data_Matrix , y_vector , theta_Vector);
  
  for(i = 1 : iter)
    old_cost = cost;
    new_thetas = log_gradient(dataMatrix , yValuesMatrix , thetaVector); % Update Thetas
    theta_Vector = theta_Vector - (learning_rate )
    % Calculate error for auditing purposes
    cost = cost_function(dataMatrix , yValuesMatrix , thetaVector);
    cost_history(i) = cost;
  end

return
end