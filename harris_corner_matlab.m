function [corners, R_map] = harris_corner_matlab(image_path)
% HARRIS_CORNER_MATLAB  Harris Corner Detector (MATLAB version)
%   [corners, R_map] = harris_corner_matlab(image_path)
%
%   This is the MATLAB version of the function harris_corner_octave.
%   
%
%   image_path : string, path of the grayscale or RGB input image.

% ---- Read and convert image ----
I = im2double(imread(image_path));
if size(I,3) == 3
    I = rgb2gray(I);
end
figure, imshow(I, []), title('Original Image');

% ---- Compute gradients (Sobel) ----
dx = [1 0 -1; 2 0 -2; 1 0 -1];
dy = [1 2 1; 0 0 0; -1 -2 -1];

Ix = conv2(I, dx, 'same');
Iy = conv2(I, dy, 'same');
figure, imshow(Ix, []), title('Ix');
figure, imshow(Iy, []), title('Iy');

% ---- Compute products of derivatives ----
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix .* Iy;

% ---- Gaussian smoothing ----
g = fspecial('gaussian', 9, 1.2);
figure, imshow(g, []), title('Gaussian Filter');

Sx2 = conv2(Ix2, g, 'same');
Sy2 = conv2(Iy2, g, 'same');
Sxy = conv2(Ixy, g, 'same');

% ---- Harris response ----
k = 0.05;
R_map = (Sx2 .* Sy2 - Sxy.^2) - k * (Sx2 + Sy2).^2;

figure, imagesc(R_map), colormap jet, colorbar;
title('R map');

% ---- Threshold on R ----
threshold = 0.3 * max(R_map(:));
corner_reg = R_map > threshold;
figure, imshow(corner_reg), title('Corner Regions');

% ---- Find centroids using regionprops ----
stats = regionprops(corner_reg, 'Centroid');

if isempty(stats)
    corners = [];
else
    corners = cat(1, stats.Centroid);
end

% ---- Plot corners on image ----
figure, imshow(I, []); hold on;
if ~isempty(corners)
    plot(corners(:,1), corners(:,2), 'ro', 'MarkerSize', 4, 'LineWidth', 1.2);
end
title('Detected Corners');
hold off;

end
