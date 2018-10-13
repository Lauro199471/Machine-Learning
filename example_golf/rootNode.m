function rootNode()
  % ===== The entropy of Target =====
  % we have 9 records with Yes
  % we have 5 records with No
  % we have 14 total records

  etroTarget_class_yes = (9/14) * log2(1 / (9/14));  
  etroTarget_class_no  = (5/14) * log2(1 / (5/14));
  totalEtroTarget = etroTarget_class_yes + etroTarget_class_no;
  fprintf('\nE(Target | 9,5) : %f\n', totalEtroTarget);

  % ===== The entropy of Outlook =====
  % ----- Sunny ----
  % we have 2 records with Sunny && Play Golf
  % we have 3 records with Sunny && No Play Golf
  % we have 5 records with Sunny

  % ----- Overcast ----
  % we have 4 records with Overcast && Play Golf
  % we have 0 records with Overcast && No Play Golf
  % we have 4 records with Overcast

  % ----- Rainy ----
  % we have 3 records with Rainy && Play Golf
  % we have 2 records with Rainy && No Play Golf
  % we have 5 records with Rainy

  etro_Outlook_Sunny_yes = (2/5) * log2(1 / (2/5));;  
  etro_Outlook_Sunny_no  = (3/5) * log2(1 / (3/5));
  etro_Outlook_Sunny = etro_Outlook_Sunny_yes + etro_Outlook_Sunny_no;

  etro_Outlook_Overcast_yes = (4/4) * log2(1 / (4/4));  
  etro_Outlook_Overcast_no  = 0;
  etro_Outlook_Overcast = etro_Outlook_Overcast_yes + etro_Outlook_Overcast_no;

  etro_Outlook_Rainy_yes = (3/5) * log2(1 / (3/5));  
  etro_Outlook_Rainy_no  = (2/5) * log2(1 / (2/5));;
  etro_Outlook_Rainy = etro_Outlook_Rainy_yes + etro_Outlook_Rainy_no;

  etro_Outlook = ((5/14) * etro_Outlook_Sunny) + ((4/14) * etro_Outlook_Overcast) + ((5/14) * etro_Outlook_Rainy);
  info_Outlook = totalEtroTarget - etro_Outlook;

  fprintf('\n----- Outlook -----\n');
  fprintf('E(Sunny    | 2,3) : %f\n', etro_Outlook_Sunny);
  fprintf('E(Overcast | 4,0) : %f\n', etro_Outlook_Overcast);
  fprintf('E(Rainy    | 3,2) : %f\n', etro_Outlook_Rainy);
  fprintf('E(Target | Outlook) : %f\n', etro_Outlook);
  fprintf('I(Target | Outlook) : %f\n', info_Outlook);

  % ===== The entropy of Temp =====
  % ----- Hot ----
  % we have 2 records with Hot && Play Golf
  % we have 2 records with Hot && No Play Golf
  % we have 4 records with Hot

  % ----- Mild ----
  % we have 4 records with Mild && Play Golf
  % we have 2 records with Mild && No Play Golf
  % we have 6 records with Mild

  % ----- Cool ----
  % we have 3 records with Cool && Play Golf
  % we have 1 records with Cool && No Play Golf
  % we have 4 records with Cool

  etro_Temp_Hot_yes = (2/4) * log2(1 / (2/4)); 
  etro_Temp_Hot_no  = (2/4) * log2(1 / (2/4));
  etro_Temp_Hot = etro_Temp_Hot_yes + etro_Temp_Hot_no;

  etro_Temp_Mild_yes = (4/6) * log2(1 / (4/6));  
  etro_Temp_Mild_no  = (2/6) * log2(1 / (2/6));
  etro_Temp_Mild = etro_Temp_Mild_yes + etro_Temp_Mild_no;

  etro_Temp_Cool_yes = (3/4) * log2(1 / (3/4));  
  etro_Temp_Cool_no  = (1/4) * log2(1 / (1/4));;
  etro_Temp_Cool = etro_Temp_Cool_yes + etro_Temp_Cool_no;

  etro_Target_Temp = ((4/14) * etro_Temp_Hot) + ((6/14) * etro_Temp_Mild) + ((4/14) * etro_Temp_Cool);
  info_Target_Temp = totalEtroTarget - etro_Target_Temp;

  fprintf('\n----- Temp -----\n');
  fprintf('E(Hot  | 2,2) : %f\n', etro_Temp_Hot);
  fprintf('E(Mild | 4,2) : %f\n', etro_Temp_Mild);
  fprintf('E(Cool | 3,1) : %f\n', etro_Temp_Cool);
  fprintf('E(Target | Temp) : %f\n', etro_Target_Temp);
  fprintf('I(Target | Temp) : %f\n', info_Target_Temp);

  % ===== The entropy of Humidity =====
  % ----- High ----
  % we have 3 records with High && Play Golf
  % we have 4 records with High && No Play Golf
  % we have 7 records with High

  % ----- Normal ----
  % we have 6 records with Normal && Play Golf
  % we have 1 records with Normal && No Play Golf
  % we have 7 records with Normal

  etro_Humidity_High_yes = (3/7) * log2(1 / (3/7)); 
  etro_Humidity_High_no  = (4/7) * log2(1 / (4/7));
  etro_Humidity_High = etro_Humidity_High_yes + etro_Humidity_High_no;

  etro_Humidity_Normal_yes = (6/7) * log2(1 / (6/7));  
  etro_Humidity_Normal_no  = (1/7) * log2(1 / (1/7));
  etro_Humidity_Normal = etro_Humidity_Normal_yes + etro_Humidity_Normal_no;

  etro_Target_Humidity = ((7/14) * etro_Humidity_High) + ((7/14) * etro_Humidity_Normal);
  info_Target_Humidity = totalEtroTarget - etro_Target_Humidity;

  fprintf('\n----- Humidity -----\n');
  fprintf('E(High   | 3,4) : %f\n', etro_Humidity_High);
  fprintf('E(Normal | 6,1) : %f\n', etro_Humidity_Normal);
  fprintf('E(Target | Humidity) : %f\n', etro_Target_Humidity);
  fprintf('I(Target | Humidity) : %f\n', info_Target_Humidity);

  % ===== The entropy of Windy =====
  % ----- False ----
  % we have 6 records with False && Play Golf
  % we have 2 records with False && No Play Golf
  % we have 8 records with False

  % ----- True ----
  % we have 3 records with True && Play Golf
  % we have 3 records with True && No Play Golf
  % we have 6 records with True

  etro_Windy_False_yes = (6/8) * log2(1 / (6/8)); 
  etro_Windy_False_no  = (2/8) * log2(1 / (2/8));
  etro_Windy_False = etro_Windy_False_yes + etro_Windy_False_no;

  etro_Windy_True_yes = (3/6) * log2(1 / (3/6));  
  etro_Windy_True_no  = (3/6) * log2(1 / (3/6));
  etro_Windy_True = etro_Windy_True_yes + etro_Windy_True_no;

  etro_Target_Windy = ((8/14) * etro_Windy_False) + ((6/14) * etro_Windy_True);
  info_Target_Windy = totalEtroTarget - etro_Target_Windy;

  fprintf('\n----- Windy -----\n');
  fprintf('E(False  | 6,2) : %f\n', etro_Windy_False);
  fprintf('E(True   | 3,3) : %f\n', etro_Windy_True);
  fprintf('E(Target | Windy) : %f\n', etro_Target_Windy);
  fprintf('I(Target | Windy) : %f\n\n\n', info_Target_Windy);

end