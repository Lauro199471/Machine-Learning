% =====  Gradient Descent Function =====
% gradient descent to learn theta
% @return
% predictions = N x 1 , Returns 1D array of predictions

function [thetas num_iter] = grad_desc(X, y , w , learning_rate)
    nSamples  = size(X,1); % M
    nFeatures = size(X,2); % N 

    converge_change=.00000000001;
    num_iter = 1;
    change_cost = 1;
    cost = cost_function(X , y , w);

    while(change_cost > converge_change);
        old_cost = cost;
        h = hypothesis_function(X*w);
        grad = (transpose(X)*(h-y)) / nSamples;
        w = w - (learning_rate * grad);

        %J_history(i) = cost_function(X , y , w);
        cost =  cost_function(X , y , w);
        change_cost = old_cost - cost;
        num_iter = num_iter + 1;

    end

    thetas = w;

    return
end
