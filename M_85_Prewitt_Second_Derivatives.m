% Matlab_85CS62113_Prewitt_Second_Derivatives.m
% H = (1/8)*[-1 -1 -1; -1 4 -1; -1 -1 -1;];
% Idea from Ex83

clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'.bmp'}, 'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);
figure(1), imshow(f);
f = im2double(f(:,:,1));

% h = 0.125*[-1 -1 -1; -1 4 -1; -1 -1 -1;];
% h = [1 1 1; 0 0 0; -1 -1 -1;];

h = fspecial('prewitt');

g2 = imfilter(f,h);
figure(3), imshow(g2)

