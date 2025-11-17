%Read all images
img_1=im2gray(imread('ur_c_s_03a_01_L_0376.png'));
img_2=im2gray(imread('ur_c_s_03a_01_L_0377.png'));
img_3=im2gray(imread('ur_c_s_03a_01_L_0378.png'));
img_4=im2gray(imread('ur_c_s_03a_01_L_0379.png'));
img_5=im2gray(imread('ur_c_s_03a_01_L_0380.png'));
img_6=im2gray(imread('ur_c_s_03a_01_L_0381.png'));
img_ex2=imread('i235.png');

%Create an array of images
image_array = {img_1, img_2, img_3, img_4, img_5, img_6};

figure(), imagesc(img_1), colormap gray, title("Original image");

%Template for the red car
T_red=img_1(360:430, 690:770);
figure(), imagesc(T_red), colormap gray, title("Template for the red car");

%Template for the balck car
T_black=img_1(370:410,560:640);
figure(), imagesc(T_black), colormap gray, title("Template for the black car");

%% Perform template matching with the template on all images

%For the red car
templateMatch(image_array, T_red);
sgtitle('Template matching result red car');

%For the balck car
[yc_b, xc_b] = templateMatch(image_array, T_black);
sgtitle('Template matching result black car');

%% Changing the size of the template
%New T centered on the black car
DifferentSize(T_black, yc_b, xc_b, 0.2, image_array);

DifferentSize(T_black, yc_b, xc_b, 2, image_array);

DifferentSize(T_black, yc_b, xc_b, 4, image_array);

%% Harris corner
Harris_corner(img_ex2); 

