function outlookSunny()
  totalEtroTarget = 0.970951; % E(sunny)
  fprintf('\nE(Target,Sunny | 2,3) : %f\n', totalEtroTarget);

  % ===== The entropy of Humidity =====
  % ----- High ----
  % we have 0 records with High && Play Golf && Sunny
  % we have 3 records with High && No Play Golf && Sunny
  % we have 3 records with High && Sunny

  % ----- Normal ----
  % we have 2 records with Normal && Play Golf && Sunny
  % we have 0 records with Normal && No Play Golf && Sunny
  % we have 2 records with Normal

  etro_Humidity_High_yes_sunny = 0; 
  etro_Humidity_High_no_sunny  = (3/3) * log2(1 / (3/3));
  etro_Humidity_High_sunny = etro_Humidity_High_yes_sunny + etro_Humidity_High_no_sunny;

  etro_Humidity_Normal_yes_sunny = (2/2) * log2(1 / (2/2));  
  etro_Humidity_Normal_no_sunny  = 0;
  etro_Humidity_Normal_sunny = etro_Humidity_Normal_yes_sunny + etro_Humidity_Normal_no_sunny;

  etro_Target_Humidity_sunny = ((3/5) * etro_Humidity_High_sunny) + ((2/5) * etro_Humidity_Normal_sunny);
  info_Target_Humidity_sunny = totalEtroTarget - etro_Target_Humidity_sunny;

  fprintf('\n----- Humidity -----\n');
  fprintf('E(High,Sunny   | 0,3) : %f\n', etro_Humidity_High_sunny);
  fprintf('E(Normal,Sunny | 2,0) : %f\n', etro_Humidity_Normal_sunny);
  fprintf('E(Target | Humidity,Sunny) : %f\n', etro_Target_Humidity_sunny);
  fprintf('I(Target | Humidity,Sunny) : %f\n', info_Target_Humidity_sunny);

  % ===== The entropy of Temp =====
  % ----- Hot ----
  % we have 2 records with Hot && Play Golf && Sunny
  % we have 0 records with Hot && No Play Golf && Sunny
  % we have 2 records with Hot && Sunny

  % ----- Mild ----
  % we have 1 records with Mild && Play Golf && Sunny
  % we have 1 records with Mild && No Play Golf && Sunny
  % we have 2 records with Mild && Sunny

  % ----- Cool ----
  % we have 1 records with Cool && Play Golf && Sunny
  % we have 0 records with Cool && No Play Golf && Sunny
  % we have 1 records with Cool && Sunny

  etro_Temp_Hot_yes_sunny = (2/2) * log2(1 / (2/2)); 
  etro_Temp_Hot_no_sunny  = 0;
  etro_Temp_Hot_sunny = etro_Temp_Hot_no_sunny + etro_Temp_Hot_yes_sunny;

  etro_Temp_Mild_yes_sunny = (1/2) * log2(1 / (1/2));  
  etro_Temp_Mild_no_sunny  = (1/2) * log2(1 / (1/2));
  etro_Temp_Mild_sunny = etro_Temp_Mild_yes_sunny + etro_Temp_Mild_no_sunny;

  etro_Temp_Cool_yes_sunny = (1/1) * log2(1 / (1/1));  
  etro_Temp_Cool_no_sunny  = 0;
  etro_Temp_Cool_sunny = etro_Temp_Cool_yes_sunny + etro_Temp_Cool_no_sunny;

  etro_Target_Temp_sunny = ((2/5) * etro_Temp_Hot_sunny) + ((2/5) * etro_Temp_Mild_sunny) + ((1/5) * etro_Temp_Cool_sunny);
  info_Target_Temp_sunny = totalEtroTarget - etro_Target_Temp_sunny;

  fprintf('\n----- Temp -----\n');
  fprintf('E(Hot,Sunny  | 2,2) : %f\n', etro_Temp_Hot_sunny);
  fprintf('E(Mild,Sunny | 4,2) : %f\n', etro_Temp_Mild_sunny);
  fprintf('E(Cool,Sunny | 3,1) : %f\n', etro_Temp_Cool_sunny);
  fprintf('E(Target | Temp,Sunny) : %f\n', etro_Target_Temp_sunny);
  fprintf('I(Target | Temp,Sunny) : %f\n', info_Target_Temp_sunny);

  % ===== The entropy of Windy =====
  % ----- False ----
  % we have 1 records with False && Play Golf && Sunny
  % we have 2 records with False && No Play Golf && Sunny
  % we have 3 records with False && Sunny

  % ----- True ----
  % we have 1 records with True && Play Golf && Sunny
  % we have 1 records with True && No Play Golf && Sunny
  % we have 2 records with True && Sunny

  etro_Windy_False_yes_sunny = (1/3) * log2(1 / (1/3)); 
  etro_Windy_False_no_sunny  = (2/3) * log2(1 / (2/3));
  etro_Windy_False_sunny = etro_Windy_False_yes_sunny + etro_Windy_False_no_sunny;

  etro_Windy_True_yes_sunny = (1/2) * log2(1 / (1/2));  
  etro_Windy_True_no_sunny  = (1/2) * log2(1 / (1/2));
  etro_Windy_True_sunny  = etro_Windy_True_yes_sunny + etro_Windy_True_no_sunny;

  etro_Target_Windy_sunny = ((3/5) * etro_Windy_False_sunny) + ((2/5) * etro_Windy_True_sunny );
  info_Target_Windy_sunny = totalEtroTarget - etro_Target_Windy_sunny;

  fprintf('\n----- Windy -----\n');
  fprintf('E(False,Sunny | 1,2) : %f\n', etro_Windy_False_sunny);
  fprintf('E(True,Sunny  | 1,1) : %f\n', etro_Windy_True_sunny);
  fprintf('E(Target | Windy,Sunny) : %f\n', etro_Target_Windy_sunny);
  fprintf('I(Target | Windy,Sunny) : %f\n\n\n', info_Target_Windy_sunny);

end