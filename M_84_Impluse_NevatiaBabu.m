% Matlab_84CS63112_Impluse_NevatiaBabu.m
% Idea from 83
% Matlab find gradient following Nevatia and Babu impluse
% หารูปแบบการตอบสนองอิมพัลส์ของแกร์เดียนใน 12 ทิศทางที่เสนอโดย Nevatia และ Babu ในรูป 8.15

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

angle = 0:45:315;
% สร้างการตอบสนองอิมพัลส์ของแกร์เดียนที่มุม 0 องศา

% ----------------- Prewitt Compass gradient ----------------- %
% prc => prewittCompass 

% Nevatia and Babu impluse 0 degree
nb = (1/1000)*[100 100 0 -100 -100; 
                100 100 0 -100 -100; 
                100 100 0 -100 -100; 
                100 100 0 -100 -100;
                100 100 0 -100 -100;];    
% Nevatia and Babu impluse 30 degrees
nb(:,:,2) =  (1/1102)*[100 -32 -100 -100 100;
                        100 78 -92 -100 -100;
                        100 100 0 -100 -100;
                        100 100 92 -78 -100;
                        100 100 100 32 -100;];  
% Nevatia and Babu impluse 60 degrees
nb(:,:,3) = (1/1102)* [-100 -100 -100 -100 -100;
                        32 -78 -100 -100 -100;
                        100 92 0 -92 -100;
                        100 100 100 78 -32;
                        100 100 100 100 100; ]; 
% Nevatia and Babu impluse 90 degrees
nb(:,:,4) = (1/1000)* [-100 -100 -100 -100 -100;
                        -100 -100 -100 -100 -100;
                        0 0 0 0 0;
                        100 100 100 100 100;
                        100 100 100 100 100;]; 
% Nevatia and Babu impluse 120 degrees         
nb(:,:,5) = (1/1102)* [-100 -100 -100 -100 -100;
                        -100 -100 -100 -78 32;
                        -100 -92 0 92 100;
                        -32 78 100 100 100;
                        100 100 100 100 100;]; 
% Nevatia and Babu impluse 150 degrees
nb(:,:,6) = (1/1102)* [-100 -100 -100 -32 100;
                        -100 -100 -92 78 100;
                        -100 -100 0 100 100;
                        -100 -78 92 100 100;
                        -100 32 100 100 100;];
% Nevatia and Babu impluse 180 degrees
nb(:,:,7) = (1/1000)* [-100 -100 0 100 100;
                        -100 -100 0 100 100;
                        -100 -100 0 100 100;
                        -100 -100 0 100 100;
                        -100 -100 0 100 100;];
% Nevatia and Babu impluse 210 degrees
nb(:,:,8) = (1/1102)* [-100 32 100 100 100;
                        -100 -78 92 100 100;
                        -100 -100 0 100 100;
                        -100 -100 -92 78 100;
                        -100 -100 -100 -32 100;];
% Nevatia and Babu impluse 240 degrees
nb(:,:,9) = (1/1102)* [100 100 100 100 100;
                        -32 78 100 100 100;
                        -100 -92 0 92 100;
                        100 -100 -100 -78 32;
                        -100 -100 -100 -100 -100;];  
% Nevatia and Babu impluse 270 degrees
nb(:,:,10) = (1/1000)* [100 100 100 100 100;
                        100 100 100 100 100;
                        0 0 0 0 0
                        -100 -100 -100 -100 -100;
                        -100 100 100 -100 -100;];
% Nevatia and Babu impluse 300 degrees
nb(:,:,11) = (1/1102)* [100 100 100 100 100;
                        100 100 100 78 -32;
                        100 92 0 -92 -100;
                        32 -78 -100 -100 -100;
                        -100 -100 -100 -100 -100;]; 
% Nevatia and Babu impluse 330 degrees
nb(:,:,12) = (1/1102)* [100 100 100 32 -100;
                        100 100 92 -78 -100;
                        100 100 0 -100 -100;
                        100 78 -92 -100 -100;
                        100 -32 -100 -100 -100;];  
                    
for ii=1:12     % ลูปจำนวน 12 ทิศทาง
    %------------Convolution------------%
                 % ข้อมูลรูปภาพ % prc ในแต่ละทิศ 
    FilImg = conv2(intdata, nb(:,:,ii), 'same');
    
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
    subplot(4,3,ii)
    imagesc(FilImg); colormap(gray)
    figure(2), axis off
end


