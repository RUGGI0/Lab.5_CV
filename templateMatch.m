function [y_center, x_center] = templateMatch(img, T)
    TM=filter2(T,img,'same');%two-dimensional correlation
    %figure,imagesc(TM),colormap gray
    
    T1=T-mean2(T);
    
    TM1=filter2(T1,img,'same');%two-dimensional correlation
    %figure,imagesc(TM1),colormap gray
    
    C = normxcorr2(T1, img);%Normalized 2-D cross-correlation
    figure,imagesc(C),colormap gray

    % Find the peak in the cross-correlation matrix
    [ypeak, xpeak] = find(C == max(C(:)));

    y_center = ypeak - size(T, 1)/2 + 1;      %Top-left coordinates of the correspondance
    x_center = xpeak - size(T, 2)/2 + 1;

    % Display the template matching result on the original image
    figure, imshow(img), hold on;
    rectangle('Position', [xpeak - size(T, 2), ypeak - size(T, 1), size(T, 2), size(T, 1)], 'EdgeColor', 'r', 'LineWidth', 2);
    line([x_center - 5, x_center + 5], [y_center, y_center], 'Color', 'r', 'LineWidth', 1); % Horizontal line
    line([x_center, x_center], [y_center - 5, y_center + 5], 'Color', 'r', 'LineWidth', 1); % Vertical line
    title('Template Matching Result');

    hold off;
    
end