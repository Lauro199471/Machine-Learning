clear;
for clc = 0:30
    disp(" ");
end

% ===== Prediciton Function =====
function prob_z = predict(dataMat,coefficientVector)
  % dataMat = M x N
  % coefficientVector = N * 1
  %@return prob_z = M * 1
  z = dataMat * coefficientVector;
  prob_z = (1 / (1+exp(-1*z)));
return
end

% ===== Cost Function =====
function cost_z = cost_function(dataMat,coefficientVector,yValuesMat)
  observations = size(dataMat,1); % Get number of Rows;bascially how many data sets do we have?
  predictions = predict(dataMat,coefficientVector);
  #Take the error when label=1 ; y*-log(h(0)) 
  class1_cost = yValuesMat * (-1 * log(predictions));
  #Take the error when label=0 ; (1-y)*-log(h(0)) 
  class2_cost = (1-yValuesMat) * (-1 * log(1-predictions));

  #Take the sum of both costs
  cost = class1_cost - class2_cost;
  #Take the average cost
  cost_z = sum(cost)/observations;

return
end

% ==== Update Coefficients ====
function coefficients = cost_function(dataMat,coefficientVector,yValuesMat,alpha)
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
% ===== MAIN =====
data = csvread('test-score.csv');
dataMatrix = data(:,1:size(data,2)-1); % data Matrix
y = data(:,size(data,2));   % Y vector
coefficientVector = (zeros(size(dataMatrix,2),1)); % vector of zeros
clear data; % no need to keep data anymore
 
posClass = find(y==1); % get rows # that have y = 1
negClass = find(y==0); % get rows # that have y = 1

figure;hold on
p1=plot(dataMatrix(posClass,1), dataMatrix(posClass,2), 'b*');
p2=plot(dataMatrix(negClass,1), dataMatrix(negClass,2), 'r*');
set(p1, 'LineWidth' , 50);
set(p2, 'LineWidth' , 50);
axis tight;
xlabel('Test 1','FontSize',35,'FontWeight','bold');
ylabel('Test 2','FontSize',35,'FontWeight','bold');

% Start to do Logistic Regression
totalCost = cost_function(dataMatrix,coefficientVector,y);

% minimize cost using gradient descent

