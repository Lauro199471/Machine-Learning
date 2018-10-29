function testSplit(featureMatrix , labelVector)
  
  [data_above data_below] = split_data(featureMatrix , 4 , 0.8);
  petal_length  = featureMatrix(:,3);

  % data_below
  setosa_index = find(labelVector == 0);
  petal_length_setosa = petal_length(setosa_index,1);
  figure(2);
  scatter( petal_length_setosa , data_below , 'r' , 'filled');
  axis([1 7 0 2.5]);
  vline(2.5,'k');


  % data_above
  vericolor_index = find(labelVector == 1);
  virginca_index = find(labelVector == 2);
  petal_length_virginca = petal_length(virginca_index,1);
  petal_length_vericolor = petal_length(vericolor_index,1);
  figure(3);
  scatter([petal_length_vericolor petal_length_virginca], data_above , 'r' , 'filled');
  axis([1 7 0 2.5]);
  vline(2.5,'k');

end