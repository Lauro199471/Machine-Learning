function isPurity = check_purity(label)
  isPurity = 0;
  [uniqueClasses uniqueClasses_counts] = uniqueness(label);
  numOfLabel = length(uniqueClasses);
  
  if( numOfLabel == 1) % this means its pure , 1 class label
    isPurity = 1;
  else
    isPurity = 0;
  end
  
end
