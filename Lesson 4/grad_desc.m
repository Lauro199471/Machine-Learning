% =====  Gradient Descent Function =====
% @param
% data_Matrix = M x N
% y_vector = M x 1
% theta_Vector = N x 1
% learning_rate = 1 x 1
% iter = 1 x 1

% @return
% predictions = N x 1 , Returns 1D array of predictions

function [theta costHistory] = grad_desc(data_Matrix, y_vector, theta_Vector, learning_rate, iter)
    theta = zeros(size(theta_Vector, 1), 1); % M x 1 Matrix
    costHistory = zeros(size(theta_Vector, 1), 1); % M x 1 Matrix
    
    y = y_vector;
    N = size(data_Matrix, 1);

    for (i = 1:iter)
        temp = zeros(N+1,1) % add zero col
        [cost temp] = cost_function(dataMatrix, yValuesMatrix); 
        % Get Hypothesis and Gradient
        [predict grad] = cost_function(dataMatrix, yValuesMatrix)
        % Get Error
        err = h - y;
        % Update the gradient
        graident = learning_rate * (1 / m) * (transpose(data_Matrix) * err);
        theta_Vector = theta_Vector - graident;
        costHistory(i) = cost_function(data_Matrix, y_vector, theta_Vector);
    end

    theta = theta_Vector;
    return
end
