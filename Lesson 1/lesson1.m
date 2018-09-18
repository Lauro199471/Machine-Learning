clf;

data = csvread('data.csv');
x = data(:,1);
y = data(:,2);
pixel_size = 50;
rgb = "g";
scatter(x,y,pixel_size,rgb,"filled");
axis([0 130 0 130]);
title("Linear Regression - Radient Descent");