% Matlab_83CS63112_PrewittCompass.m
% Idea from Ex81 - Ex82
% หาแกร์เดียน ตามรูปแบบ Prewitt Compass gradient ภาพ 8.13

[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp';'*.tiff';'*.gif'}, 'File Selector');
pathf = strcat(pathname, filename);
bb = imread(pathf);
figure(1), imagesc(bb)
axis off
aa = im2double(bb(:,:,1));

intdata = 255*aa(:,:,1);
size(intdata); m = ans(1); n = ans(2);

figure(2), imagesc(aa), colormap(gray)
% h = (1/5)*[1 1 -1; 1 -2 -1; 1 1 -1];
angle = [0:45:315]; % สร้างการตอบสนองอิมพัลส์ของแกร์เดียนที่มุม 0 องศา

% ----------------- Prewitt Compass gradient ----------------- %
% prc => prewittCompass 
prc = (1/5)*[1 1 -1; 1 -2 -1; 1 1 -1];           % East
prc(:,:,2) =  (1/5)*[1 -1 -1; 1 -2 -1; 1 1 1];   % Northeast
prc(:,:,3) = (1/5)* [-1 -1 -1; -1 -2 -1; 1 1 1]; % North
prc(:,:,4) = (1/5)* [-1 -1 1; -1 -2 1; 1 1 1];   % Northwest
prc(:,:,5) = (1/5)* [-1 1 1; -1 -2 1; -1 1 1];   % West
prc(:,:,6) = (1/5)* [1 1 1; -1 -2 1; -1 -1 1];   % Southwest
prc(:,:,7) = (1/5)* [1 1 1; 1 -2 1; -1 -1 -1];   % south
prc(:,:,8) = (1/5)* [1 1 1; 1 -2 -1; 1 -1 -1];   % southeast

for ii=1:8     % ลูปจำนวน 8 ทิศทาง
    %------------Convolution------------%
                 % ข้อมูลรูปภาพ % prc ในแต่ละทิศ 
    FilImg = conv2(intdata, prc(:,:,ii), 'same');
    
    c00 = sprintf('I%d=FilImg;',ii);
    eval(c00);
    for l=1:size(FilImg,1)
        for k=1:size(FilImg,2)
            if FilImg(l,k)>angle
                T(l,k) = 0;
            else
                T(l,k) = 1;
            end
        end
    end
    %  ภาพแกร์เดียน
    c00 = sprintf('T%d = T;', ii);
    eval(c00);
    figure(2)
    subplot(2,4,ii)
    imagesc(FilImg); colormap(gray)
    figure(2), axis off
end
