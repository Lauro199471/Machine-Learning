% Convert probabilities to classes
% input  - N element array of predictions between 0 and 1
% output - N element array of 0s (False) and 1s (True)

% ==== classifiy ====
% predicitons    = A x 1
% @return theta  = A x 1

function probVect = classifiy(predicitons)  
  probVect = predicitons; % Allicate Matrix
  N = size(predicitons,1); % get Rows
  
  for(i = 1 : N)
    if(predicitons(i) >= 0.5)
        probVect(i) = 1;
    else
        probVect(i) = 0;
    end
  end

return
end
