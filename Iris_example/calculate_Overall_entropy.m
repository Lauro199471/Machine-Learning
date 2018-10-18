function overal_entropy = calculate_Overall_entropy(data_below , data_above)

    data_below_entropy = calculate_entropy(transpose(data_below));
    data_above_entropy = calculate_entropy(transpose(data_above));
    
    nSamples = size(data_above,2) + size(data_below,2)

    probalilityBelow = size(data_below,2) / nSamples
    probalilityAbove = size(data_above,2) / nSamples
    
    overal_entropy = (probalilityBelow * data_below_entropy) + (probalilityAbove + data_above_entropy);
    
end