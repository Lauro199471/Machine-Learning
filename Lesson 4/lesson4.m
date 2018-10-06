clear;
for clc = 0:30
    disp(" ");
end


% ===== MAIN =====
datafile = csvread('data_classification.csv');
dataMatrix = datafile(:,1:size(datafile,2)-1); % data Matrix (M x N)
yMatrix = datafile(:,size(datafile,2));        % Y vector ( M x 1)
clear datafile; % no need to keep datafile anymore

% ===== Plot Data =====
plotData(dataMatrix,yMatrix); 

% ===== Do Logistic Regression =====
oneCol = (ones(size(dataMatrix),1));
dataMatrix = [oneCol,dataMatrix];
theta_Vector = (zeros(size(dataMatrix,2),1)); % (N x 1)

learning_rate = 0.01;
iter = 3000;

[thetaBro costBro] = training(dataMatrix, yMatrix , theta_Vector , learning_rate,iter);
costBro(1)
costBro(1000)
costBro(2000)

% ===== Plot Cost Data =====
plot(1:3000,costBro);