delete('\c\export\*.jpg');
delete('\c\export\parameter.txt');
copyfile('\c\para\ori.jpg','D:\commaster\export\Original.jpg');
mypicture=imread('\c\para\ori.jpg');
[para]=textread('\c\para\dct.txt','%n')
%figure(),imshow(mypicture),title(' ');
grayImage=rgb2gray(mypicture);
%figure(),imshow(grayImage),title(' ');
dctgrayImage=dct2(grayImage);
%figure();imshow(log(abs(dctgrayImage)),[]);,title('DCT tranform');
imwrite(log(abs(dctgrayImage)),'\c\export\DCTtrans.jpg');
%colormap(gray(4));colorbar;
dctgrayImage(abs(dctgrayImage)<para)=0;
I=idct2(dctgrayImage)/255;
%figure();imshow(I),title(' ');
%figure(),subplot(121),imshow(grayImage),title(' '),
%subplot(122),imshow(I),title('DCT tranform'),
imwrite(I,'\c\para\com.jpg');
imwrite(I,'\c\export\Compressed.jpg');




