function outlookRainy()
  totalEtroTarget = 0.970951; % E(sunny)
  fprintf('\nE(Target,Rainy | 2,3) : %f\n', totalEtroTarget);
  % ===== The entropy of Temp =====
  % ----- Hot ----
  % we have 0 records with Hot && Play Golf && Rainy
  % we have 0 records with Hot && No Play Golf && Rainy
  % we have 0 records with Hot && Rainy

  % ----- Mild ----
  % we have 2 records with Mild && Play Golf && Rainy
  % we have 1 records with Mild && No Play Golf && Rainy
  % we have 3 records with Mild && Rainy

  % ----- Cool ----
  % we have 1 records with Cool && Play Golf && Rainy
  % we have 1 records with Cool && No Play Golf && Rainy
  % we have 2 records with Cool && Rainy

  etro_Temp_Hot_yes_rainy = 0; 
  etro_Temp_Hot_no_rainy  = 0;
  etro_Temp_Hot_rainy = etro_Temp_Hot_no_rainy + etro_Temp_Hot_yes_rainy;

  etro_Temp_Mild_yes_rainy = (2/3) * log2(1 / (2/3));  
  etro_Temp_Mild_no_rainy =  (1/3) * log2(1 / (1/3));
  etro_Temp_Mild_rainy = etro_Temp_Mild_yes_rainy + etro_Temp_Mild_no_rainy;

  etro_Temp_Cool_yes_rainy = (1/2) * log2(1 / (1/2));  
  etro_Temp_Cool_no_rainy = (1/2) * log2(1 / (1/2));  
  etro_Temp_Cool_rainy = etro_Temp_Cool_yes_rainy + etro_Temp_Cool_no_rainy;

  etro_Target_Temp_rainy = ((0) * etro_Temp_Hot_rainy) + ((3/5) * etro_Temp_Mild_rainy) + ((2/5) * etro_Temp_Cool_rainy);
  info_Target_Temp_rainy = totalEtroTarget - etro_Target_Temp_rainy;

  fprintf('\n----- Temp -----\n');
  fprintf('E(Hot,Rainy  | 2,2) : %f\n', etro_Temp_Hot_rainy);
  fprintf('E(Mild,Rainy | 4,2) : %f\n', etro_Temp_Mild_rainy);
  fprintf('E(Cool,Rainy | 3,1) : %f\n', etro_Temp_Cool_rainy);
  fprintf('E(Target | Temp,Rainy) : %f\n', etro_Target_Temp_rainy);
  fprintf('I(Target | Temp,Rainy) : %f\n', info_Target_Temp_rainy);

    % ===== The entropy of Windy =====
  % ----- False ----
  % we have 3 records with False && Play Golf && Rainy
  % we have 0 records with False && No Play Golf && Rainy
  % we have 3 records with False && Sunny

  % ----- True ----
  % we have 0 records with True && Play Golf && Rainy
  % we have 2 records with True && No Play Golf && Rainy
  % we have 2 records with True && Sunny

  etro_Windy_False_yes_rainy = (3/3) * log2(1 / (3/3)); 
  etro_Windy_False_no_rainy  = 0;
  etro_Windy_False_rainy = etro_Windy_False_yes_rainy + etro_Windy_False_no_rainy;

  etro_Windy_True_yes_rainy = 0;  
  etro_Windy_True_no_rainy  = (2/2) * log2(1 / (2/2));
  etro_Windy_True_rainy  = etro_Windy_True_yes_rainy + etro_Windy_True_no_rainy;

  etro_Target_Windy_rainy = ((3/5) * etro_Windy_False_rainy) + ((2/5) * etro_Windy_True_rainy );
  info_Target_Windy_rainy = totalEtroTarget - etro_Target_Windy_rainy;

  fprintf('\n----- Windy -----\n');
  fprintf('E(False,Rainy | 1,2) : %f\n', etro_Windy_False_rainy);
  fprintf('E(True,Rainy  | 1,1) : %f\n', etro_Windy_True_rainy);
  fprintf('E(Target | Windy,Rainy) : %f\n', etro_Target_Windy_rainy);
  fprintf('I(Target | Windy,Rainy) : %f\n\n\n', info_Target_Windy_rainy);
end