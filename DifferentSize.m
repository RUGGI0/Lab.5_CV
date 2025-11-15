function DifferentSize(T, yc, xc, mol, array)
    newT = imresize(T, [size(T, 1) * mol, size(T, 2) * mol]); % Resize template T
    newT = array{1}(round(yc - size(newT, 1)/2):round(yc + size(newT, 1)/2 - 1), round(xc - size(newT, 2)/2):round(xc + size(newT, 2)/2 - 1)); % Center new T
    
    figure(),imagesc(newT),colormap gray, title(['New template with a size of X', num2str(mol)]);
    
    % Perform template matching with the resized template
    tic;
    templateMatch(array, newT);
    time = toc;
    disp("Time of computing with size of x" + mol + ": " + time);
    sgtitle(['Template matching result with template size of X', num2str(mol)]);
end