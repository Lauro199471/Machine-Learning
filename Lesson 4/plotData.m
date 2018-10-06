function plotData(dataMatrix , yMatrix)
    
    posClass = find(yMatrix==1); % get rows # that have y = 1
    negClass = find(yMatrix==0); % get rows # that have y = 0

    figure;hold on
    p1=plot(dataMatrix(posClass,1), dataMatrix(posClass,2), 'b*');
    p2=plot(dataMatrix(negClass,1), dataMatrix(negClass,2), 'r*');
    set(p1, 'LineWidth' , 50);
    set(p2, 'LineWidth' , 50);
    axis tight;
    xlabel('Test 1','FontSize',35,'FontWeight','bold');
    ylabel('Test 2','FontSize',35,'FontWeight','bold');

end