function entropy = calculate_entropy(data)
  
  labelColmIndex = size(data,2);
  labelColm = data(: , labelColmIndex);

  [uniqueClasses uniqueClasses_counts] = uniqueness(labelColm);
  
  probability = uniqueClasses_counts ./ sum(uniqueClasses_counts);
  
  for(index = 1 : size(probability,1))
    entropy(index,1) = probability(index) * log2(1 / probability(index));
  end
  
  entropy = sum(entropy);

return
end