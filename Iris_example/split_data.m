function [data_above data_below] = split_data(data , split_colm , split_decision )
  nSamples = size(data , 1);
  split_data = data(: , split_colm);

  ptr1 = 1;
  ptr2 = 1;

  for(row_index = 1 : nSamples)
    if(split_data(row_index) <= split_decision)
      data_below(ptr1) = split_data(row_index);
      ptr1 = ptr1 + 1;
    else
      data_above(ptr2) = split_data(row_index);
      ptr2 = ptr2 + 1;
    end
  end

  return
end