function [feature]=feature_extraction(image,n)

%% convert rgb to lab
colorTransform = makecform('srgb2lab');
lab = applycform(image, colorTransform);
lab=double(lab);
%% gaussian filter
%creating gaussian filter
gau_1=fspecial('gaussian',n,1);
gau_2=fspecial('gaussian',n,2);
gau_3=fspecial('gaussian',n,4);

%feature extraction gaussian filter

feat2=imfilter(lab(:,:,2),gau_1); 
feat3=imfilter(lab(:,:,3),gau_1); 
feat9=imfilter(lab(:,:,3),gau_3); 

%% log filter
%creating laplacian of gaussian filter
log_1=fspecial('log',n,1);
log_2=fspecial('log',n,2);
log_3=fspecial('log',n,4);
log_4=fspecial('log',n,8);


%% gradient using first order derivative of gaussian 
[feat14 feat15]=gaussgradient(lab(:,:,1),2);

%% rgb feature 
feat18=image(:,:,1);
feat19=image(:,:,2);
feat20=image(:,:,3);

%% log b feature
feat22=log(double(feat20)+1);

%% combine all features
feature=[feat2(:)';feat3(:)'; feat9(:)'; feat15(:)' ;feat22(:)'];
feature=double(feature);
end
