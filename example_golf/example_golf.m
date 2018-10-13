%% Initialization
clear ; close all; clc;
for clc = 0:2
    disp(" ");
end

% ===== MAIN =====
% Get Data
data = csvread('playGolf.csv');
fprintf('Matrix = \n');
disp(data);

M = size(data,1);
N = size(data,2);
fprintf('size : %d x %d\n\n', M ,N);

featureMatrix = data(:,1:N-1);
fprintf('Feature Matrix = \n');
disp(featureMatrix);

targetMatrix = data(:,N);
fprintf('\nTarget Matrix = \n');
disp(targetMatrix);

clear data;

% ===== Find Root Node =====
rootNode();

% ===== OutLook is now Parent =====
fprintf('\n----- OUTLOOK(P) -----\n');
outlookSunny();
outlookRainy();
