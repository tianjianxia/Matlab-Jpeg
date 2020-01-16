% Main function of the final project
delete('\c\export\*.jpg');
delete('\c\export\parameter.txt');
copyfile('\c\para\ori.jpg','\c\export\Original.jpg');
% Read the original images to the matrix orig_image;
clear orig_image;
clear temp_image;
temp_image = imread('\c\para\ori.jpg');
orig_image(:,:,:,1) = double(temp_image(:,:,:,1));


% Image compression
% You are required to implement this part
% Note: The components of comp_image should be integers
starttime = cputime;
clear comp_image;

[comp_image_Y1,comp_image_U1,comp_image_V1] = Compress(orig_image(:,:,:,1));

comp_size = comp_image_Y1.realsize+comp_image_U1.realsize+comp_image_V1.realsize;

%comp_image = zeros(comp_image_Y1.realsize,comp_image_U1.realsize,comp_image_V1.realsize);
% Image decompression
% You are required to implement this part
% Note: The components of reco_image shoud be integers
%       The size of the reco_image should be same with the orig_image
clear reco_image;

s_image1 = Decompress(comp_image_Y1,comp_image_U1,comp_image_V1);

%figure,imshow(s_image),title('jjiayatuxl');

reco_image(:,:,:,1) = double(s_image1(:,:,:,1));

runtime = cputime - starttime;

% Check the size of the recovered image
%clear sizevector1;
%clear sizevector2;
%[m1,m2,m3] = size(orig_image);
%sizevector1 = size(orig_image);
%sizevector2 = size(reco_image);
%if sizevector1==sizevector2
    
    % Calculate the compression ratio
    %comp_image = double(comp_image);
    %comp_ratio = Compratio(orig_image, round(comp_image));
    %comp_ratio = m1*m2*m3/comp_size;
    % Calculate the distortion of the recovered images using Mean Square Error
    reco_image = double(reco_image);
    %MSE = CalMSE(orig_image, round(reco_image));
    % Display the original image and recovered image
    %figure(1);
    %subplot(1,2,1);
    %clear disp_image;
    %disp_image = orig_image(:,:,:,1);
    %imdisplay(disp_image);
    %title('Original Image 1');
    %subplot(1,2,2);
    clear disp_image;
    disp_image = reco_image(:,:,:,1);
    imwrite(disp_image,'\c\export\Recompressed.jpg');
    imdisplay(disp_image);
    %title('Recovered Image 1');
      
    % Output the performance
    %ratiomesg = sprintf('The compression ratio is = %6.2f\n', comp_ratio);
    %disp(ratiomesg );
    %distortionmesg = sprintf('The MSE is = %6.2f\n', MSE);
    %disp(distortionmesg );
    %timemesg = sprintf('The running time is = %6.2f\n', runtime);
    %disp(timemesg );     
%else
    %disp('The size of the recovered image is not correct');
%end
   