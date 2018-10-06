clear;
for clc = 0:30
    disp(" ");
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

