% Returns Most Label 

function classification = classify_data(data)
  [uniqueClasses uniqueClasses_counts] = uniqueness(data);
  [valueMax classificationIndex] = max(uniqueClasses_counts);
  classification = uniqueClasses(classificationIndex);
  return
end