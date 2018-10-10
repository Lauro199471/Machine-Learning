function plotData(X , y )
    % Create New Figure
    figure; hold on;

    % Find Indices of Positive and Negative Examples
    posClass = find(y==1); % get rows # that have y = 1
    negClass = find(y==0); % get rows # that have y = 0

    % Plot Examples
    plot(X(posClass, 1), X(posClass, 2), 'o', 'MarkerFaceColor', 'b' ,'MarkerSize', 16);
    plot(X(negClass, 1), X(negClass, 2), 'o', 'MarkerFaceColor', 'r' ,'MarkerSize', 16);
    axis([-2, 12, -2, 12])
    hold off;
end