% MATLAB TRICK 
% size(M,1) = row size
% size(M,2) = col size
% ====================
clf;
clear;
for clc = 0:30
    disp(" ");
end

% X(theta) = y
data = csvread('data.csv')
X = data(:,1:size(data,2)-1); % X Matrix
y = data(:,size(data,2));   % Y vector
X

oneCol = (ones(size(X),1))
 % Xsize x 1 of 1's
X = [oneCol,X];
Xt = transpose(X);

% Print out data
X
y
Xt

% theta = ((Xt * X) ^ -1 ) Xt * y
a = inverse(Xt * X);
b = Xt * y;

format long
theta = a * b

newy = X * theta
y