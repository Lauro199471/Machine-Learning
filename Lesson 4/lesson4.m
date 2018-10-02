clf;
clear;
for clc = 0:30
    disp(" ");
end

% X(theta) = y
data = csvread('data.csv');
X = data(:,1:4); % X Matrix
y = data(:,5);   % y vector
oneCol = (ones(size(X),1)); % Xsize x 1 of 1's
X = [oneCol,X];
Xt = transpose(X);

% theta = ((Xt * X) ^ -1 ) Xt * y
a = inverse(Xt * X);
b = Xt * y;

theta = a * b

newy = X * theta
y