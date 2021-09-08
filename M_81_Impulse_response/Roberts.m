% เป็นส่วนหนึ่งของ CH8 81 CS63112
% Impulse response Separated pixel difference
function [HR,HC,Gc] = Roberts(img)
f=img;
aa = im2double(f);
intdata = 255*aa(:,:,1);
size(intdata); m = ans(1); n = ans(2);

RobertsR = zeros(3,3);
RobertsR(1,3) = -1; RobertsR(2,2) = 1;

% convolution 2d 
HR = conv2(intdata, RobertsR, 'same');

RobertsC = zeros(3,3);
RobertsC(1,1) = -1; RobertsC(2,2) = 1; 
HC = conv2(intdata, RobertsC, 'same');
Gc = abs(HR)+abs(HC);

% ------ Out put --------- %
% figure("Name", "Roberts")

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


