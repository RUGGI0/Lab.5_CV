function [y_temp, x_temp] = templateMatch(img_array, T)    
    fig1 = figure();
    fig2 = figure();
    T1 = T-mean2(T);
    
    for i = 1:length(img_array)
        C = normxcorr2(T1, img_array{i});     %Normalized 2-D cross-correlation

        % Find the peak in the cross-correlation matrix
        [ypeak, xpeak] = find(C == max(C(:)));

        %Center of the correspondence
        y_center = ypeak - size(T, 1)/2 + 1;
        x_center = xpeak - size(T, 2)/2 + 1;

        if(i == 1)
            x_temp = x_center;
            y_temp = y_center;
        end

        figure(fig1)
        subplot(2,3,i),imagesc(C),colormap gray, title("NCC result");
        hold on;
        plot(xpeak, ypeak, 'rx', 'MarkerSize', 15, 'LineWidth', 2);

        % Display the template matching result on the original image
        figure(fig2)
        subplot(2,3,i), imshow(img_array{i}), hold on;
        rectangle('Position', [xpeak - size(T, 2), ypeak - size(T, 1), size(T, 2), size(T, 1)], 'EdgeColor', 'r', 'LineWidth', 2);
        line([x_center - 5, x_center + 5], [y_center, y_center], 'Color', 'r', 'LineWidth', 1); % Horizontal line
        line([x_center, x_center], [y_center - 5, y_center + 5], 'Color', 'r', 'LineWidth', 1); % Vertical line
        title('Template Matching Result');
        hold off;
    end  
end