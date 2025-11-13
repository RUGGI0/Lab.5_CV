%% ============================================================
%  Lab 5 - Computer Vision
%  Main script
%  ============================================================

clc; clear; close all;

%% -------------------------------
%  1. NCC-based segmentation
%  -------------------------------

%Read all the images
img_1=im2gray(imread('ur_c_s_03a_01_L_0376.png'));
img_2=im2gray(imread('ur_c_s_03a_01_L_0377.png'));
img_3=im2gray(imread('ur_c_s_03a_01_L_0378.png'));
img_4=im2gray(imread('ur_c_s_03a_01_L_0379.png'));
img_5=im2gray(imread('ur_c_s_03a_01_L_0380.png'));
img_6=im2gray(imread('ur_c_s_03a_01_L_0381.png'));

image_array = {img_1, img_2, img_3, img_4, img_5, img_6};
img_1 = im2gray(img_1);

figure(), imagesc(img_1), colormap gray;

T=img_1(370:410,560:640);

% figure,imagesc(T),colormap gray
% 
% T1=T-mean2(T);
% 
% TM1=filter2(T1,img_1,'same');%two-dimensional correlation
% figure,imagesc(TM1),colormap gray
% 
% C = normxcorr2(T, img_1);%Normalized 2-D cross-correlation
% figure,imagesc(C),colormap gray
[yc, xc] = templateMatch(img_1, T);

% Perform template matching with the resized template on all images
for i = 2:length(image_array)
    templateMatch(image_array{i}, T);
end

%% Changing size of the template
%New T centered in xc and yc
DifferentSize(T, yc, xc, 2, image_array)

DifferentSize(T, yc, xc, 4, image_array)

DifferentSize(T, yc, xc, 0.5, image_array)

%% -------------------------------
%  2. Harris Corner Detection
%  -------------------------------

disp('Running Harris Corner Detector...');
%WARNING: choose the right version: matlab/octave (matlab version must be tested)
[corners, R_map] = harris_corner_octave('i235.png'); 
%WARNING: choose the right version: matlab/octave (matlab version must be tested)
disp('Harris Corner Detection completed.');

%% -------------------------------
%  End of script
%  -------------------------------
disp('=== LAB 5 Completed ===');
