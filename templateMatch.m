function [xpeak, ypeak] = templateMatch(img, T)
    TM=filter2(T,img,'same');%two-dimensional correlation
    %figure,imagesc(TM),colormap gray
    
    T1=T-mean2(T);
    
    TM1=filter2(T1,img,'same');%two-dimensional correlation
    %figure,imagesc(TM1),colormap gray
    
    C = normxcorr2(T, img);%Normalized 2-D cross-correlation
    %figure,imagesc(C),colormap gray

    % Find the peak in the cross-correlation matrix
    [ypeak, xpeak] = find(C == max(C(:)));

    % Display the template matching result on the original image
    figure, imshow(img), hold on;
    rectangle('Position', [xpeak - size(T, 2), ypeak - size(T, 1), size(T, 2), size(T, 1)], 'EdgeColor', 'r', 'LineWidth', 2);
    line([xpeak - 5, xpeak + 5], [ypeak, ypeak], 'Color', 'r', 'LineWidth', 2); % Horizontal line
    line([xpeak, xpeak], [ypeak - 5, ypeak + 5], 'Color', 'r', 'LineWidth', 2); % Vertical line
    title('Template Matching Result');

    hold off;
    
end