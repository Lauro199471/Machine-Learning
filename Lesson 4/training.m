% ===== Training Function =====
%cost_function(dataMat,coefficientVector,yValuesMat,alpha)
function probVect = training(dataMatrix,coefficientVector,yMatrix,learningRate,iterations)
  % @ predicitons = 1xN
  
  probVect = predicitons;
  coefificents
  
  for(i = 1 : iterations)
    cost = cost_function(dataMatrix,coefficientVector,yMatrix,learningRate);
    % Calculate error for auditing purposes
    
  end

return
end