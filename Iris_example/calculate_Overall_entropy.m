function overall_entropy = calculate_Overall_entropy(data_below , data_above)

    data_below_entropy = calculate_entropy(data_below);
    data_above_entropy = calculate_entropy(data_above);
    
    nSamples = size(data_above,1) + size(data_below,1);

    probalilityBelow = size(data_below,1) / nSamples;
    probalilityAbove = size(data_above,1) / nSamples;
    
    overall_entropy = (probalilityBelow * data_below_entropy) + (probalilityAbove * data_above_entropy);
    
end