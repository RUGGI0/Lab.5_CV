%Read all the images
img_1=im2gray(imread('ur_c_s_03a_01_L_0376.png'));
img_2=im2gray(imread('ur_c_s_03a_01_L_0377.png'));
img_3=im2gray(imread('ur_c_s_03a_01_L_0378.png'));
img_4=im2gray(imread('ur_c_s_03a_01_L_0379.png'));
img_5=im2gray(imread('ur_c_s_03a_01_L_0380.png'));
img_6=im2gray(imread('ur_c_s_03a_01_L_0381.png'));

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
[xc, yc] = templateMatch(img_1, T);
templateMatch(img_2, T);
templateMatch(img_3, T);
templateMatch(img_4, T);
templateMatch(img_5, T);
templateMatch(img_6, T);

%%

T2=img_1(xc-45:xc+45, yc-85:yc+85);
figure,imagesc(T2),colormap gray
templateMatch(img_2, T2);


