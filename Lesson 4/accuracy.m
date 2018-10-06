
% Accuracy measures how correct our predictions were. 
% In this case we simple compare predicted labels to true labels and divide by the total.

% ===== Prediciton Function =====


function accuruate = accuracy(predicted_Y , actual_Y)  
    diff = predicted_Y - actual_Y;
    accuruate = 1 - (find( diff != 0) / size(diff,1));
return
end