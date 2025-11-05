%% ============================================================
%  Lab 5 - Computer Vision
%  Main script
%  ============================================================

clc; clear; close all;

%% -------------------------------
%  1. NCC-based segmentation
%  -------------------------------


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
