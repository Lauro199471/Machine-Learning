% Assign class labels (0 or 1) to our predicted probabilities.

% ===== Decision Boundry =====
function prob = decision_boundry(probability)
  % @ probability = 1x1 
  
  if(probability >= 0.5)
    prob = 1;
  else
    prob = 0;
  end
return
end