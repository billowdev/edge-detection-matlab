% เป็นส่วนหนึ่งของ CH881CS63112
% Impulse response Prewitt
function [HR,HC,Gc] = Prewitt(img)
f=img;
aa = im2double(f);
intdata = 255*aa(:,:,1);
size(intdata); m = ans(1); n = ans(2);

PrewittR = zeros(3,3);
PrewittR(1,1) = 1; PrewittR(1,3) = -1;
PrewittR(2,1) = 1; PrewittR(2,3) = -1;
PrewittR(3,1) = 1; PrewittR(3,3) = -1;
PrewittR = (1/3) * PrewittR
% convolution 2d 
HR = conv2(intdata, PrewittR, 'same');

PrewittC = zeros(3,3);
PrewittC(1,1) = -1; PrewittC(1,2) = -1; PrewittC(1,3) = -1;
PrewittC(3,1) = 1; PrewittC(3,2) = 1; PrewittC(3,3) = 1;
PrewittC = (1/3) * PrewittC
HC = conv2(intdata, PrewittC, 'same');
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


