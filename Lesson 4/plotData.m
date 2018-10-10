function plotData(X , y ,xLabel , yLabel)
    % Create New Figure
    figure; hold on;

    % Find Indices of Positive and Negative Examples
    posClass = find(y==1); % get rows # that have y = 1
    negClass = find(y==0); % get rows # that have y = 0

    p1=plot(X(posClass,1), X(posClass,2), 'b*');
    hold on;
    p2=plot(X(negClass,1), X(negClass,2), 'r*');
    set(p1, 'LineWidth' , 35);
    set(p2, 'LineWidth' , 35);
    axis([-2 12 -2 12]);

    xlabel(xLabel,'FontSize',50,'FontWeight','bold');
    ylabel(yLabel,'FontSize',50,'FontWeight','bold');

    hold off;
end