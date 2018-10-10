%% Initialization
clear ; close all; clc
clear;
for clc = 0:10
    disp(" ");
end


%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.
data = load('dataClass.txt');
X = data(:,1:size(data,2)-1); % X Matrix (M x N)
y = data(:,size(data,2));     % y vector (M x 1)

%% ==================== Part 1: Plotting ====================
%  We start the exercise by first plotting the data to understand the 
%  the problem we are working with.
disp('--> Plotting Data');

plotData(X, y);
% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')
% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;

%% ============ Part 2: Compute Cost and Gradient ============
%  In this part, we will implement the cost and gradient
%  for logistic regression.

%Get number of Samples and features and add w0 col to data matrix
nSamples  = size(X,1);
nFeatures = size(X,2);
X = [ones(nSamples,1) X];

% initalize w parameters
initial_w = zeros(nFeatures+1,1);

% Compute and display initial cost and gradient
[cost, grad] = costFunction(initial_w, X, y);

fprintf('--> Cost at initial theta (zeros): %f\n', cost);
fprintf('--> Gradient at initial theta (zeros): \n');
fprintf('\t%f \n', grad);

%% ============= Part 3: Optimizing using fminunc  =============
%  In this part, we will use a built-in function (fminunc) to find the
%  optimal parameters theta.

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_w);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);


% Plot Boundary
plotDecisionBoundary(theta, X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;