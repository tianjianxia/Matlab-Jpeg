delete('\c\export\*.jpg');
delete('\c\export\parameter.txt');
copyfile('\c\para\ori.jpg','\c\export\Original.jpg');
mypicture=imread('\c\para\ori.jpg');
[para]=textread('\c\para\dwt.txt','%n')
switch para
    case 1
        wavename='haar'
    case 2
        wavename='db4'
    case 3
        wavename='sym4'
    case 4
        wavename='coif4'
end

grayImage=rgb2gray(mypicture);


[ca,ch,cv,cd]=dwt2(grayImage,wavename);
ma=upcoef2('a',ca,wavename,1); 
mh=upcoef2('a',ch,wavename,1); 
mv=upcoef2('a',cv,wavename,1); 
md=upcoef2('a',cd,wavename,1); 

%figure();
%subplot(2,2,1);imshow(ma,[]);title(' ');
%subplot(2,2,2);imshow(mh,[0,30]);title(' ');
%subplot(2,2,3);imshow(mv,[0,30]);title(' ');
%subplot(2,2,4);imshow(md,[0,30]);title(' ');
%grey image
ma=(ma)/255;
ma=im2uint8(ma);
%figure();
%subplot(1,2,1);imshow(grayImage);title(' ');
%subplot(1,2,2);imshow(ma);title(' ');
imwrite(ma,'\c\export\Approximation.jpg');
imwrite(ma,'\c\para\com.jpg');
imwrite(ma,'\c\export\Compressed.jpg');
imwrite(mh,'\c\export\Horizontal.jpg');
imwrite(mv,'\c\export\Vertical.jpg');
imwrite(md,'\c\export\Diagonal.jpg'); 

