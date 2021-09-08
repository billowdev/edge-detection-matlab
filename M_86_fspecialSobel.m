% fspecial and imfilter find edge sobel pattern
clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'.bmp'}, 'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);
figure(1), imshow(f);
f = im2double(f(:,:,1));

w = fspecial('sobel');

g = imfilter(f,w);
figure(2), imshow(g)