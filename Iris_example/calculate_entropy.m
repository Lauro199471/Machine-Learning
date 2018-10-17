function entropy = calculate_entropy(data)
  dataCol = data(: , size(data,2));  
  [uniqueClasses uniqueClasses_counts] = uniqueness(dataCol);
  
  probability = uniqueClasses_counts ./ sum(uniqueClasses_counts);
  
  for(index = 1 : size(probability,1))
    entropy(index) = probability(index) * log2(1 / probability(index));
  end
  
  entropy = sum(entropy);

return
end