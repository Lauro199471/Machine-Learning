function [uniqueClasses uniqueClasses_counts] = uniqueness(data)
  [uniqueClasses , B , ic] = unique(data);
  uniqueClasses_counts = accumarray(ic,1);
  
  return
end