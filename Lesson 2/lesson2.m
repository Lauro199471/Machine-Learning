clf;
clear;
for clc = 0:30
    disp(" ");
end
figure(1, 'position',[0,0,1000,1000]);

data = csvread('data.csv');
x = data(:,1);
y = data(:,2);
pixel_size = 50;
rgb = "g";
scatter(x,y,pixel_size,rgb,"filled");
axis([0 130 0 130]);
title("Linear Regression - Radient Descent");

% ==== Initilaze Linear Regression Parameter =====
N = length(data);
m = 0;
b = 0;
interaions = 1500;
alpha = 0.01;
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
    
    % === Graph as it Calculates ====
    if (mod(iter,2) == 0)
      hold on
      yLine = (xLine * m) + b;
      p = plot(xLine,yLine,'color',rand(1,3));
      set(p, 'LineWidth' , 1);
      hold off
      pause(0.001);
    end
end

% ==== Graph Final ====
fprintf("Slope:%.3f\ny-interept:%.3f" , m , b);

xLine = 1:1:100;
yLine = (xLine * m) + b;

hold on;
p = plot(xLine,yLine,'color','red');
set(p, 'LineWidth' , 5);
hold off
