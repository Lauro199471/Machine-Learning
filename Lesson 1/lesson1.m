clf;

data = csvread('data.csv');
x = data(:,1);
y = data(:,2);
pixel_size = 50;
rgb = "g";
scatter(x,y,pixel_size,rgb,"filled");
axis([0 130 0 130]);
title("Linear Regression - Radient Descent");








// y = mx + b , find m & b

// initi m & b to 0
m = 0;
b = 0;

// Do Gradient Descent ( adjust 'b' and 'm')

learning_rate = 0.01;
// look through all the data set
for (i=0;i < data.length;i++)
{
    // get x and y
    y = data[i].y;
    x = data[i].x;

    guess = m * x + b;
    error = y - guess;

    m = m + (error * x) * learning_rate;
    b = b + (error) * learning_rate ;

}


// Proportional
error = target value - sensor reading

// Derivative
Derivative = error - previous_error
previous_error = error;

// Integral
Integral = Integral + error;
if(error = 0)
    Integral = 0;
    