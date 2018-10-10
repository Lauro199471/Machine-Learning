%% Initialization
clear ; close all; clc;
for clc = 0:10
    disp(" ");
end

% ===== MAIN =====
% Load the Data Set and Plot it
data = load('data.txt');
dataCol = size(data,2);

X = data( : , 1:(dataCol-1) ); % X Matrix (M x N)
y = data( : , dataCol);      % y vector (M x 1)
clear data;
clear dataCol;

%% ==================== Part 1: Plot Data ====================
plotData(X,y,'Hours Study','Hours Slept'); 

%% ============ Part 2: Compute Cost and Gradient ============
nSamples = size(X,1); % M
% Add X0 Col to X
oneCol = ones(nSamples,1);
X = [oneCol X];
nFeatures = size(X,2);

% initalize Theta(w) parameters
initial_w = zeros(nFeatures,1);
% Get Initilze Predicitions
hx = hypothesis_function(X * initial_w); % (M x N)*(N x 1)
% Compute and display initial cost and gradient
cost = costFunction(X , initial_w , y , hx);
grad = gradFunction(X , initial_w , y , hx);

fprintf('--> Cost at initial theta (zeros): %f\n', cost);
fprintf('--> Gradient at initial theta (zeros): \n');
fprintf('\t%f \n', grad);

%% ============= Part 3: Optimizing using fminunc  =============
learning_rate = 0.0014;
iter = 2000000;
[w cost] = gradientDescent(X, initial_w , y, learning_rate, iter);

fprintf('--> Cost at Final theta (zeros): %f\n', cost);
fprintf('--> Gradient at Final theta (zeros): \n');
fprintf('\t%f \n', w);