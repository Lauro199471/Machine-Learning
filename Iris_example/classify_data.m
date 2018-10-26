function classification = classify_data(data)
  labelVector = data(:,size(data,2));
  [uniqueClasses uniqueClasses_counts] = uniqueness(labelVector);
  [valueMax classificationIndex] = max(uniqueClasses_counts);
  classification = uniqueClasses(classificationIndex);
  return
end