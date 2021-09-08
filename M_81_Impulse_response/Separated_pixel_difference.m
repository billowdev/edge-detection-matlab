% เป็นส่วนหนึ่งของ CH8 81CS63112
function [HR,HC,Gc] = Separated_pixel_difference(img)
f=img;
aa = im2double(f);
intdata = 255*aa(:,:,1);
size(intdata); m = ans(1); n = ans(2);

SepaaratedPDR = zeros(3,3);
SepaaratedPDR(1,2) = 1; SepaaratedPDR(2,3) = -1;

% convolution 2d 
HR = conv2(intdata, SepaaratedPDR, 'same');

SepaaratedPDC = zeros(3,3);
SepaaratedPDC(1,2) = -1; SepaaratedPDC(3,2) = 1; 
HC = conv2(intdata, SepaaratedPDC, 'same');
Gc = abs(HR)+abs(HC);
% ------ Out put --------- %
% figure("Name", "Separated_pixel_difference")
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


