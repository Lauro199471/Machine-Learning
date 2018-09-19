clf;
clear;
for clc = 0:30
    disp(" ");
end

data = csvread('data.csv');
x = data(:,1);
y = data(:,2);

% ==== Initilaze Linear Regression Parameter =====
N = length(data);
m = 0;
b = 0;
interaions = 15000;
alpha = 0.01;
fprintf("Running Radient Descent....\n");

J_history = zeros(interaions,1);

for iter = 1 :interaions
    idx = mod(iter,100)+1;
    hypothesis = (x(idx) * m) + b;
    
    temp_m = m - alpha*((1/N) * sum(hypothesis - y(idx)) * x(idx));
    temp_b = b - alpha*((1/N) * sum(hypothesis - y(idx)) * 1);

    m = temp_m;
    b = temp_b;
    J_history(iter) = (1/(2*N)) * sum((hypothesis - y(idx)) ^ 2);
end

% ==== Graph ====
fprintf("Slope:%.3f\ny-interept:%.3f" , m , b);

xLine = 1:1:100;
yLine = (xLine * m) + b;
pixel_size = 50;
rgb = "g";
scatter(x,y,pixel_size,rgb,"filled");
axis([0 130 0 130]);
title("Linear Regression - Radient Descent");

hold on;

p = plot(xLine,yLine,'color','red');
set(p, 'LineWidth' , 5);
