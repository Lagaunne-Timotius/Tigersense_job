%use it when pictures folder is the current folder
%%feature processing
function [all_feature] = feature_processing()
all=dir;
all_feature=[];
for i=3:29
    i
    Ori_image=imread(all(i).name);
    % resize image
    resize_image= imresize(Ori_image,[160,160]);
    %paramater for feature extraction
    n=[3 3];
    [feature]=feature_extraction(resize_image,n)
    all_feature=[all_feature,feature];
end 
end