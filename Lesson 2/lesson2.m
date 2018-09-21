clf;
clear;
for clc = 0:30
    disp(" ");
end

figure(1, 'position',[0,0,1500,500]);
axis([0 1000 0 50]);
title("Linear Regression - Radient Descent",'fontsize',30);

data = csvread('data.csv');
x = data(:,1);
y = data(:,2);

% ==== Initilaze Linear Regression Parameter =====
N = length(data);
m = 0;
b = 0;
interaions = 1500;
alpha = 0.0001;
fprintf("Running Radient Descent....\n");

J_history = zeros(interaions,1);
xLine = 40:1:60;

for iter = 1 :interaions
    
    idx = mod(iter,100)+1;
    hypothesis = (x(idx) * m) + b;
    
    temp_m = m - alpha*((1/N) * sum(hypothesis - y(idx)) * x(idx));
    temp_b = b - alpha*((1/N) * sum(hypothesis - y(idx)) * 1);

    m = temp_m;
    b = temp_b;
    
    J_history(iter) = (1/(2*N)) * sum((hypothesis - y(idx)) ^ 2);
    
end

% ==== Graph Final ====
fprintf("Slope:%.3f\ny-interept:%.3f" , m , b);

xLine = 1:1:length(J_history);
yLine = J_history;

hold on;
p = plot(xLine,yLine,'color','red');
set(p, 'LineWidth' , 3);
annotation('textbox', [0.35,0.75,0.5,0.1], 'string', 'Alpha = 0.0001',
           'FontSize',50);
hold off
