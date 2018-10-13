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

% ===== The entropy of Target =====
% we have 4 records with 0's
% we have 4 records with 1's
% we have 8 total records

etroTarget_class1 = (4/8) * log2(1 / (4/8));  
etroTarget_class2 = (4/8) * log2(1 / (4/8));
totalEtroTarget = etroTarget_class1 + etroTarget_class2;
fprintf('\nE(Target_class1) : %f\n', etroTarget_class1);
fprintf('E(Target_class2) : %f\n', etroTarget_class2);
fprintf('E(Total Target) : %f\n', totalEtroTarget);

% ===== The entropy of Outlook =====
% we have 0 records with 0's && True (Play Golf)
% we have 3 records with 0's && False (No Play Golf)
% we have 3 records with 0's

% we have 2 records with 1's && True (Play Golf)
% we have 0 records with 1's && False (No Play Golf)
% we have 2 records with 1's

% we have 2 records with 2's && True (Play Golf)
% we have 1 records with 2's && False (No Play Golf)
% we have 3 records with 2's

etro_Outlook_class1_yesPlay = 0;  
etro_Outlook_class1_noPlay  = (3/3) * log2(1 / (3/3));
etro_Outlook_class1 = etro_Outlook_class1_yesPlay + etro_Outlook_class1_noPlay;
infoTarget_Outlook_C1 = totalEtroTarget - etro_Outlook_class1;

etro_Outlook_class2_yesPlay = (2/2) * log2(1 / (2/2));  
etro_Outlook_class2_noPlay  = 0;
etro_Outlook_class2 = etro_Outlook_class2_yesPlay + etro_Outlook_class2_noPlay;
infoTarget_Outlook_C2 = totalEtroTarget - etro_Outlook_class2;

etro_Outlook_class3_yesPlay = (2/3) * log2(1 / (2/3));  
etro_Outlook_class3_noPlay  = (1/3) * log2(1 / (1/3));;
etro_Outlook_class3 = etro_Outlook_class3_yesPlay + etro_Outlook_class3_noPlay;
infoTarget_Outlook_C3 = totalEtroTarget - etro_Outlook_class3;

fprintf('\n----- Outlook -----\n');
fprintf('\nE(Outlook_class1) : %f\n', etro_Outlook_class1);
fprintf('I(Outlook_class1) : %f\n', infoTarget_Outlook_C1);

fprintf('\nE(Outlook_class2) : %f\n', etro_Outlook_class2);
fprintf('I(Outlook_class2) : %f\n', infoTarget_Outlook_C2);

fprintf('\nE(Outlook_class3) : %f\n', etro_Outlook_class3);
fprintf('I(Outlook_class3) : %f\n', infoTarget_Outlook_C3);

% ===== The entropy of TEMP =====
% we have 1 records with 0's && True (Play Golf)
% we have 2 records with 0's && False (No Play Golf)
% we have 3 records with 0's

% we have 2 records with 1's && True (Play Golf)
% we have 0 records with 1's && False (No Play Golf)
% we have 2 records with 1's

% we have 2 records with 2's && True (Play Golf)
% we have 1 records with 2's && False (No Play Golf)
% we have 3 records with 2's

etro_Temp_class1_yesPlay = (1/3) * log2(1 / (1/3)); 
etro_Temp_class1_noPlay  = (2/3) * log2(1 / (2/3));
etro_Temp_class1 = etro_Temp_class1_yesPlay + etro_Temp_class1_noPlay;
infoTarget_Temp_C1 = totalEtroTarget - etro_Temp_class1;

etro_Temp_class2_yesPlay = (2/2) * log2(1 / (2/2));  
etro_Temp_class2_noPlay  = 0;
etro_Temp_class2 = etro_Temp_class2_yesPlay + etro_Temp_class2_noPlay;
infoTarget_Temp_C2 = totalEtroTarget - etro_Temp_class2;

etro_Temp_class3_yesPlay = (2/3) * log2(1 / (2/3));  
etro_Temp_class3_noPlay  = (1/3) * log2(1 / (1/3));;
etro_Temp_class3 = etro_Temp_class3_yesPlay + etro_Temp_class3_noPlay;
infoTarget_Temp_C3 = totalEtroTarget - etro_Temp_class3;

fprintf('\n----- Temp -----\n');
fprintf('\nE(Temp_class1) : %f\n', etro_Temp_class1);
fprintf('I(Temp_class1) : %f\n', infoTarget_Temp_C1);

fprintf('\nE(Temp_class2) : %f\n', etro_Temp_class2);
fprintf('I(Temp_class2) : %f\n', infoTarget_Temp_C2);

fprintf('\nE(Temp_class3) : %f\n', etro_Temp_class3);
fprintf('I(Temp_class3) : %f\n', infoTarget_Temp_C3);

% ===== The entropy of Humidity =====
% we have 3 records with 0's && True (Play Golf)
% we have 2 records with 0's && False (No Play Golf)
% we have 5 records with 0's

% we have 2 records with 1's && True (Play Golf)
% we have 1 records with 1's && False (No Play Golf)
% we have 3 records with 1's

etro_Humidity_class1_yesPlay = (1/5) * log2(1 / (1/5)); 
etro_Humidity_class1_noPlay  = (2/5) * log2(1 / (2/5));
etro_Humidity_class1 = etro_Temp_class1_yesPlay + etro_Temp_class1_noPlay;
infoTarget_Humidity_C1 = totalEtroTarget - etro_Temp_class1;

etro_Humidity_class2_yesPlay = (2/3) * log2(1 / (2/3));  
etro_Humidity_class2_noPlay  = (1/3) * log2(1 / (1/3));
etro_Humidity_class2 = etro_Humidity_class2_noPlay + etro_Humidity_class2_yesPlay;
infoTarget_Humidity_C2 = totalEtroTarget - etro_Humidity_class2;

fprintf('\n----- Humidity -----\n');
fprintf('\nE(Humidity_class1) : %f\n', etro_Humidity_class1);
fprintf('I(Humidity_class1) : %f\n', infoTarget_Humidity_C1);

fprintf('\nE(Humidity_class2) : %f\n', etro_Humidity_class2);
fprintf('I(Humidity_class2) : %f\n', infoTarget_Humidity_C2);

% ===== The entropy of Windy =====
% we have 3 records with 0's && True (Play Golf)
% we have 2 records with 0's && False (No Play Golf)
% we have 5 records with 0's

% we have 1 records with 1's && True (Play Golf)
% we have 2 records with 1's && False (No Play Golf)
% we have 3 records with 1's

etro_Windy_class1_yesPlay = (3/5) * log2(1 / (3/5)); 
etro_Windy_class1_noPlay  = (2/5) * log2(1 / (2/5));
etro_Windy_class1 = etro_Windy_class1_yesPlay + etro_Windy_class1_noPlay;
infoTarget_Windy_C1 = totalEtroTarget - etro_Windy_class1;

etro_Windy_class2_yesPlay = (1/3) * log2(1 / (1/3));  
etro_Windy_class2_noPlay  = (2/3) * log2(1 / (2/3)); 
etro_Windy_class2 = etro_Windy_class2_noPlay + etro_Windy_class2_yesPlay;
infoTarget_Windy_C2 = totalEtroTarget - etro_Windy_class2;

fprintf('\n----- Windy -----\n');
fprintf('\nE(Windy_class1) : %f\n', etro_Windy_class1);
fprintf('I(Windy_class1) : %f\n', infoTarget_Windy_C1);

fprintf('\nE(Windy_class2) : %f\n', etro_Windy_class2);
fprintf('I(Windy_class2) : %f\n', infoTarget_Windy_C2);