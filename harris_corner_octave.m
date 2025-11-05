function [corners, R_map] = harris_corner(image_path)


% --- Ensure Octave compatibility ---
if exist('OCTAVE_VERSION', 'builtin')
    pkg load image;
end

% Read and convert image
I = double(imread(image_path));
if size(I,3) == 3
    I = rgb2gray(uint8(I));
    I = double(I);
end
figure, imagesc(I), axis image off, colormap gray, title('Original Image');

% Compute derivatives
dx = [1 0 -1; 2 0 -2; 1 0 -1];
dy = [1 2 1; 0 0 0; -1 -2 -1];
Ix = conv2(I, dx, 'same');
Iy = conv2(I, dy, 'same');
figure, imagesc(Ix), axis image off, colormap gray, title('Ix');
figure, imagesc(Iy), axis image off, colormap gray, title('Iy');

% Products of derivatives
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix .* Iy;

% Gaussian smoothing
g = fspecial('gaussian', 9, 1.2);
figure, imagesc(g), axis image off, colormap gray, title('Gaussian Filter');
Sx2 = conv2(Ix2, g, 'same');
Sy2 = conv2(Iy2, g, 'same');
Sxy = conv2(Ixy, g, 'same');

% Harris response
k = 0.05;
R_map = (Sx2 .* Sy2 - Sxy.^2) - k * (Sx2 + Sy2).^2;
figure, imagesc(R_map), axis image off, colormap jet, colorbar, title('R map');

% Thresholding
threshold = 0.3 * max(R_map(:));
corner_reg = R_map > threshold;
figure, imagesc(corner_reg), axis image off, colormap gray, title('Corner Regions');

% Find centroids of corner blobs
stats = regionprops(corner_reg, 'Centroid');
if isempty(stats)
    corners = [];
else
    corners = cat(1, stats.Centroid);
end

% Show corners on image
figure, imagesc(I), axis image off, colormap gray; hold on;
if ~isempty(corners)
    plot(corners(:,1), corners(:,2), 'ro', 'MarkerSize', 4, 'LineWidth', 1.2);
end
title('Detected Corners');
hold off;
end
