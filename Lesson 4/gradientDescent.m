%GRADIENTDESCENT Performs gradient descent to learn theta
% =====  Gradient Descent Function =====
% @param
% X = M x N
% w = N x 1
% y = M x 1
% learning_rate = 1 x 1
% iter = 1 x 1

% @return
% optmized_w = N x 1 , Returns 1D array of predictions

function [w cost] = gradientDescent(X, w , y, learning_rate, iter)
    nSamples = size(X,1);
    j_history = zeros(iter,1);
    
    for(iter = 1 : iter)
        hx = hypothesis_function(X * w); % (M x N)*(N x 1)
        grad = (1/nSamples)*(transpose(X) * (hx - y));
        w = w - (learning_rate * grad);
    end

    cost = costFunction(X , w , y , hx);
return
end
