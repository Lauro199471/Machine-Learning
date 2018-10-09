function plotData(X , Y , xLabel , yLabel)
    
    posClass = find(Y==1); % get rows # that have y = 1
    negClass = find(Y==0); % get rows # that have y = 0

    figure;
    p1=plot(X(posClass,1), X(posClass,2), 'b*');
    hold on;
    p2=plot(X(negClass,1), X(negClass,2), 'r*');
    set(p1, 'LineWidth' , 35);
    set(p2, 'LineWidth' , 35);
    axis([-2 12 -2 12]);

    xlabel(xLabel,'FontSize',45,'FontWeight','bold');
    ylabel(yLabel,'FontSize',45,'FontWeight','bold');

end