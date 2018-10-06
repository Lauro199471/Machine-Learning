function probVect = classifiytest(predicitons)
  probVect = predicitons;
  probVect = size(predicitons,2);

  for(i = 1 : size(predicitons,2))
    probVect(i) = decision_boundrytest(predicitons(i));
  end
return
end