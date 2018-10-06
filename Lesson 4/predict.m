% ===== Prediciton Function =====
function prob_z = predict(dataMat,coefficientVector)
  % dataMat = M x N
  % coefficientVector = N * 1
  %@return prob_z = M * 1
  z = dataMat * coefficientVector;
  prob_z = (1 / (1+exp(-1*z)));
return
end