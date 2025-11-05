%% ============================================================
%  Lab 5 - Computer Vision
%  Main script
%  ============================================================

clc; clear; close all;

disp('=== LAB 5: NCC-based Segmentation & Harris Corner Detection ===');

%% -------------------------------
%  1. NCC-based segmentation
%  -------------------------------
%  (Sezione svolta dai tuoi colleghi)
%  Esempio:
%  images_list = {
%      'ur_c_s_03a_01_L_0376.png'
%      'ur_c_s_03a_01_L_0377.png'
%      'ur_c_s_03a_01_L_0378.png'
%      'ur_c_s_03a_01_L_0379.png'
%      'ur_c_s_03a_01_L_0380.png'
%      'ur_c_s_03a_01_L_0381.png'};
%
%  Template_Matching('ur_c_s_03a_01_L_0376.png', images_list, [x1 y1 x2 y2], 'red car');

%% -------------------------------
%  2. Harris Corner Detection
%  -------------------------------
disp('Running Harris Corner Detector...');
[corners, R_map] = harris_corner_octave('i235.png');
disp('Harris Corner Detection completed.');

%% -------------------------------
%  End of script
%  -------------------------------
disp('=== LAB 5 Completed ===');
