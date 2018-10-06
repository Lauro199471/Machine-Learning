% ==== Update Coefficients ====
function coefficients = update_coefficient(dataMat,coefficientVector,yValuesMat,alpha)
  N = size(dataMat,1);
  coefficients = coefficientVector;
  
  % 1 - Get Predictions
  predictions = predict(dataMat,coefficientVector);
  
  % 2 - Transpose features from (100, 3) to (3, 100) [1 c0 c1]
  % So we can multiply w the (100,1)  cost matrix.
  % Returns a (3,1) matrix holding 3 partial derivatives --
  % one for each feature -- representing the aggregate
  % slope of the cost function across all observations
  gradient = transpose(dataMat) * (predictions - yValuesMat);

  % 3 - Take the average cost derivative for each feature
  gradient = gradient / N;
 
  % 4 - Multiply the gradient by our learning rate
  gradient = gradient * alpha;
  
  %5 - Subtract from our weights to minimize cost
  coefficients = coefficients - gradient;

return
end