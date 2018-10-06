% Convert probabilities to classes
% input  - N element array of predictions between 0 and 1
% output - N element array of 0s (False) and 1s (True)

function probVect = classifiy(predicitons)  
  probVect = predicitons; % Allicate Matrix

  for(i = 1 : size(predicitons,2))
    probVect(i) = decision_boundry(predicitons(i));
  end

return
end