clear;
for clc = 0:30
    disp(" ");
end


% ===== MAIN =====
data = csvread('test-score.csv');
dataMatrix = data(:,1:size(data,2)-1); % data Matrix
yMatrix = data(:,size(data,2));        % Y vector
theta_Vector = (zeros(size(dataMatrix,2),1)); % vector of zeros
clear data; % no need to keep data anymore

plotData(dataMatrix,yMatrix); 
