function [data_above data_below] = split_data(data , split_colm , split_decision )
  nSamples = size(data , 1);
  split_data = data(: , split_colm);

  ptr1 = 1;
  ptr2 = 1;

  for(row_index = 1 : nSamples)
    if(split_data(row_index) <= split_decision)
      below_index(ptr1,1) = ptr1;
      ptr1 = ptr1 + 1;
    else
      above_index(ptr2,1) = ptr2;
      ptr2 = ptr2 + 1;
    end
  end

  above_index = size(below_index,1) .+ above_index;
  
  for(below_index_i = 1 : size(below_index,1))
    data_below(below_index_i,:) = data(below_index(below_index_i) , :);
  end

  for(above_index_i = 1 : size(above_index,1))
    data_above(above_index_i,:) = data(above_index(above_index_i) , :);
  end

  return
end