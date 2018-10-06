function probVect = classifiy(predicitons)
  % @ predicitons = 1xN
  
  probVect = predicitons;

  for(i = 1 : size(predicitons,2))
    probVect(i) = decision_boundry(predicitons(i));
  end

return
end