clear;
for clc = 0:10
    disp(" ");
end


% ===== MAIN =====
% Load the Data Set and Plot it
datafile = csvread('data_classification.csv');
data_Matrix = datafile(:,1:size(datafile,2)-1); % data Matrix (M x N)
y_vector = datafile(:,size(datafile,2));        % Y vector ( M x 1)
plotData(data_Matrix,y_vector , 'Hours Slept' , 'Hours Studied'); 
legend('Passed','Failed');
clear datafile; % no need to keep datafile anymore





learning_rate = 0.01;
iter = 2000;

[A B] = cost_function(data_Matrix, y_vector);
A
B
