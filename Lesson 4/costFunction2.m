function [J, grad] = costFunction2(theta, dataMatrix, y)
  hx = predict(X , theta);
  m = length(X);

  J = (-y' * log(hx) - (1 - y')*log(1 - hx)) / m;
  grad = X' * (hx - y) / m;

end