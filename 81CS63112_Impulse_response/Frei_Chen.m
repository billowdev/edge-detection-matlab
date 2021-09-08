% เป็นส่วนหนึ่งของ CH881CS63112
% Impulse response Frei_Chen
function [HR,HC,Gc] = Frei_Chen(img)
f=img;
aa = im2double(f);
intdata = 255*aa(:,:,1);
size(intdata); m = ans(1); n = ans(2);

Frei_ChenR = zeros(3,3);
Frei_ChenR(1,1) = 1;        Frei_ChenR(1,3) = -1;
Frei_ChenR(2,1) = sqrt(2);  Frei_ChenR(2,3) = -(sqrt(2));
Frei_ChenR(3,1) = 1;        Frei_ChenR(3,3) = -1;
Frei_ChenR = (1/(2+(sqrt(2)))) * Frei_ChenR;
% convolution 2d 
HR = conv2(intdata, Frei_ChenR, 'same');

Frei_ChenC = zeros(3,3);

Frei_ChenR(1,1) = -1; Frei_ChenR(1,2) = -(sqrt(2)); Frei_ChenR(1,3) = -1;
Frei_ChenR(3,1) = 1;  Frei_ChenR(3,2) = sqrt(2);    Frei_ChenR(3,3) = 1;
Frei_ChenC = (1/(2+(sqrt(2)))) * Frei_ChenC;
HC = conv2(intdata, Frei_ChenC, 'same');
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


