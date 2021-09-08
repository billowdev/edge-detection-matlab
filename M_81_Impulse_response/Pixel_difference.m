% เป็นส่วนหนึ่งของ CH8 81 CS63112
% Impulse response Pixel difference
function [HR,HC,Gc] = Pixel_difference(img)
f = img;

aa = im2double(f);
intdata = 255*aa(:,:,1);
size(intdata); m = ans(1); n = ans(2);

pixelDifR = zeros(3,3);
pixelDifR(2,2) = 1; pixelDifR(2,3) = -1;

% convolution 2d 
HR = conv2(intdata, pixelDifR, 'same');

pixelDifC = zeros(3,3);
pixelDifC(1,2) = -1; pixelDifC(2,2) = 1; 
HC = conv2(intdata, pixelDifC, 'same');

Gc = abs(HR)+abs(HC);

% figure("Name", "Pixel_difference")

% subplot(2,2,1)
% imagesc(f); colormap(gray), axis off
% 
% subplot(2,2,2)
% image(HR); colormap(gray), axis off
% 
% subplot(2,2,3) 
% image(HC); colormap(gray), axis off
% 
% subplot(2,2,4)
% image(Gc); colormap(gray), axis off
