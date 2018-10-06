clear;
for clc = 0:30
    disp(" ");
end


% ===== MAIN =====
% Load the Data Set and Plot it
datafile = csvread('data_classification.csv');
data_Matrix = datafile(:,1:size(datafile,2)-1); % data Matrix (M x N)
y_vector = datafile(:,size(datafile,2));        % Y vector ( M x 1)
plotData(data_Matrix,y_vector); 
clear datafile; % no need to keep datafile anymore

% Add the 1's Col. to the Data Set 
% Xo = 1 , X1 = Studied Hours , X2 = Slept Hours
oneCol = (ones(size(data_Matrix),1));
data_Matrix = [oneCol,data_Matrix];

# initial theta values 
theta_Vector = (zeros(size(data_Matrix,2),1)); % (N x 1)
learning_rate = 0.01;
iter = 3000;

pred =  update_thetas(data_Matrix , y_vector , theta_Vector , learning_rate) 
disp("All Good");