% ==== Update Thetas ====
% Vectorized Gradient Descent
% dataMatrix     = M x N
% yValuesMatrix  = M x 1
% thetaVector    = N x 1
% learning_rate  = 1 x 1
% @return calcThetas = N x 1 

function calcThetas = update_thetas(dataMatrix , yValuesMatrix , thetaVector , learning_rate) 

  logTheta = log_gradient(dataMatrix , yValuesMatrix , thetaVector); % N x 1

  for(i = 1: size(thetaVector,1)) % 1 : N
    thetaVector(i) = thetaVector(i) - (learning_rate * logTheta(i));
  end

  calcThetas = thetaVector;
  
return
end