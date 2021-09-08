% เป็นส่วนหนึ่งของ CH881CS63112
% Impulse response Sobel
function [HR,HC,Gc]=Sobel(img)
f=img;
aa = im2double(f);
intdata = 255*aa(:,:,1);
size(intdata); m = ans(1); n = ans(2);

SobelR = zeros(3,3);
SobelR(1,1) = 1; SobelR(1,3) = -1;
SobelR(2,1) = 2; SobelR(2,3) = -2;
SobelR(3,1) = 1; SobelR(3,3) = -1;
SobelR = (1/4) * SobelR
% convolution 2d 
HR = conv2(intdata, SobelR, 'same');

SobelC = zeros(3,3);
SobelC(1,1) = -1; SobelC(1,2) = -2; SobelC(1,3) = -1;
SobelC(3,1) = 1; SobelC(3,2) = 2; SobelC(3,3) = 1;
SobelC = (1/4) * SobelC
HC = conv2(intdata, SobelC, 'same');
Gc = abs(HR)+abs(HC);

% ------ Out put --------- %
% figure("Name", "Prewitt")
% 
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


