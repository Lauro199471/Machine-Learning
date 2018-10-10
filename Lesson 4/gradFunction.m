% Gradient is simply a vector which gives the direction 
% of maximum rate of change. By taking steps in that 
% direction, we hope to reach our optimal solution.

% ===== Grad Function =====
% X = M x N
% w = M x 1
% y = N x 1

% @return grad = N x 1

function grad = gradFunction(X , w , y , hx)

    nSample  = size(X,1);
    nFeature = size(X,2);
  
    % Get Gradient
    grad = zeros(size(w,1),1);
    for(i = 1 : nFeature) % 1 ~ N
      grad(i) = (1/nSample) * sum((hx-y) .* X(:,i) );
    end

return
end
  