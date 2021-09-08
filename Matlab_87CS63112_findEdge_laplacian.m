clear
[filename pathname] = uigetfile({'*.jpg';'*.png';'.bmp'}, 'File Selector');
pathf = strcat(pathname, filename);
img = imread(pathf);


f = im2double(img(:,:,1));
l = "prewitt sobel roberts canny log";
l = split(l);

bw1 =  edge(f, 'prewitt');
bw2 =  edge(f, 'sobel');
bw3 =  edge(f, 'roberts');
bw4 =  edge(f, 'canny');
bw5 =  edge(f, 'log');

figure(1)
subplot(3,2,1)
imagesc(f); 
title('Original Image') 
axis off

subplot(3,2,2)
imagesc(bw1); colormap(gray)
title('prewitt') 
axis off
subplot(3,2,3)
imagesc(bw2); colormap(gray)
title('sobel') 
axis off
subplot(3,2,4)
imagesc(bw3); colormap(gray)
title('roberts')
axis off
subplot(3,2,5)
imagesc(bw4); colormap(gray)
title('canny')
axis off
subplot(3,2,6)
imagesc(bw5); colormap(gray)
title('log')
axis off
figure(1), axis off

 hFig2 = figure(1);
 set(hFig2, 'Position', [10 10 650 650])