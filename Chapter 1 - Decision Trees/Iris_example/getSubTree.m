function subTree = getSubTree(data)
   global level = 1;

    % If its a leaf return answer
    % Is Data pure?
    if(check_purity(data) == 1)
        % return Label Class
        subTree = num2str(classify_data(data));

    % else return subTree
    else
        potential_splits =  get_potential_splits(data);
        [best_feature_value best_split_value] = determine_best_split(data , potential_splits);
        [data_above data_below] = split_data(data , best_feature_value , best_split_value );
        subTree = ['? ' , num2str(best_feature_value) , ' <= ' , num2str(best_split_value) ];
    end
end