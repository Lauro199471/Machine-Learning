function isPurity = check_purity(data)
  isPurity = 0;
  labelVector = data(: , size(data,2));

  [uniqueClasses uniqueClasses_counts] = uniqueness(labelVector);
  numOfLabel = length(uniqueClasses); % counts how many different values for label the data has
  
  if( numOfLabel == 1) % this means its pure , 1 class label
    isPurity = 1;
  else
    isPurity = 0;
  end
  
end
