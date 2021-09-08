% ทำการหาขอบภาพโดยใช้การตอบสนองอิมพัลส์ในรูปที่ 8.10 Impulse response
clear
% clf
[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
img = imread(pathf);

% Impulse response

[HR(:,:,1), HC(:,:,1), Gc(:,:,1)] = Pixel_difference(img);
[HR(:,:,2), HC(:,:,2), Gc(:,:,2)] = Separated_pixel_difference(img);
[HR(:,:,3), HC(:,:,3), Gc(:,:,3)] = Roberts(img);
[HR(:,:,4), HC(:,:,4), Gc(:,:,4)] = Prewitt(img);
[HR(:,:,5), HC(:,:,5), Gc(:,:,5)] = Sobel(img);
[HR(:,:,6), HC(:,:,6), Gc(:,:,6)] = Frei_Chen(img);


figure("Name", "Result impluse")
subplot(6,4,1)
imagesc(img); colormap(gray), axis off
title('Pixel difference')
subplot(6,4,2)
image(HR(:,:,1)); colormap(gray), axis off
title('HR')
subplot(6,4,3) 
image(HC(:,:,1)); colormap(gray), axis off
title('HC')
subplot(6,4,4)
image(Gc(:,:,1)); colormap(gray), axis off
title('Gc')

subplot(6,4,5)
imagesc(img); colormap(gray), axis off
title('Separated pixel difference')
subplot(6,4,6)
image(HR(:,:,2)); colormap(gray), axis off
title('HR')
subplot(6,4,7) 
image(HC(:,:,2)); colormap(gray), axis off
title('HC')
subplot(6,4,8)
image(Gc(:,:,2)); colormap(gray), axis off
title('Gc')

subplot(6,4,9)
imagesc(img); colormap(gray), axis off
title('Roberts')
subplot(6,4,10)
image(HR(:,:,3)); colormap(gray), axis off
title('HR')
subplot(6,4,11) 
image(HC(:,:,3)); colormap(gray), axis off
title('HC')
subplot(6,4,12)
image(Gc(:,:,3)); colormap(gray), axis off
title('Gc')

subplot(6,4,13)
imagesc(img); colormap(gray), axis off
title('Prewitt')
subplot(6,4,14)
image(HR(:,:,4)); colormap(gray), axis off
title('HR')
subplot(6,4,15) 
image(HC(:,:,4)); colormap(gray), axis off
title('HC')
subplot(6,4,16)
image(Gc(:,:,4)); colormap(gray), axis off
title('Gc')

subplot(6,4,17)
imagesc(img); colormap(gray), axis off
title('Sobel')
subplot(6,4,18)
image(HR(:,:,5)); colormap(gray), axis off
title('HR')
subplot(6,4,19) 
image(HC(:,:,5)); colormap(gray), axis off
title('HC')
subplot(6,4,20)
image(Gc(:,:,5)); colormap(gray), axis off
title('Gc')


subplot(6,4,21)
imagesc(img); colormap(gray), axis off
title('Frei_Chen')
subplot(6,4,22)
image(HR(:,:,6)); colormap(gray), axis off
title('HR')
subplot(6,4,23) 
image(HC(:,:,6)); colormap(gray), axis off
title('HC')
subplot(6,4,24)
image(Gc(:,:,6)); colormap(gray), axis off
title('Gc')

hFig = figure(1);
set(hFig, 'Position', [14 44 650 650])