% Matlab_82CS63112_Prewitt_Low_filter.m

% H(j,k) = 
clear
% clf
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
f = imread(pathf);

aa = im2double(f);
intdata = 255*aa(:,:,1);
size(intdata); m = ans(1); n = ans(2);

PrewittG = zeros(3,3);
PrewittG(1,1) = 1; PrewittG(1,3) = -1;
PrewittG(2,1) = 1; PrewittG(2,3) = -1;
PrewittG(3,1) = 1; PrewittG(3,3) = -1;
PrewittG = (1/3) * PrewittG
% convolution 2d 
HG = conv2(intdata, PrewittG, 'same');

Low_filterS = 1/9 * ones(3,3);
Low_filterS(1,1) = -1; Low_filterS(1,2) = -1; Low_filterS(1,3) = -1;
Low_filterS(3,1) = 1; Low_filterS(3,2) = 1; Low_filterS(3,3) = 1;
Low_filterS = (1/3) * Low_filterS
HC = conv2(intdata, Low_filterS, 'same');
Gc = abs(HG)+abs(HC);

% ------ Out put --------- %
figure("Name", " Hg (impulse Prewitt) * Hs (Low_filter_impulse)")

subplot(2,2,1)
imagesc(f); colormap(gray), axis off

subplot(2,2,2)
image(HG); colormap(gray), axis off

subplot(2,2,3) 
image(HC); colormap(gray), axis off

subplot(2,2,4)
image(Gc); colormap(gray), axis off


