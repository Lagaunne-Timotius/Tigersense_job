%%This is main function that do the LDA and score the image segmentation result with the
%%groundtruth image. 
%
%Explanation of Variables:
%-MixtureGaussianRGBnew.mat is the matrix form of the image 
%-groundtruth.mat is the ground truth of the image segmentation in matrix
%-F is the variable of MixtureGaussianRGBnew.mat
%-WF is the groundtruth matrix variable
%-A is used for all feature that will be score 
%-B is the  highest score matrix
%-S is the accumulation of feature and score that consecutively added in the model in greedy way 
%-temp is dummy variable for feature number 
%-o is all the feature that will be score and added to the model
%-m,n is dummy variable for the loop
%-F_main is the dummy variabl to keep the original image segmentation matrix
%-Z is the LDA result

%Clearing working space and loading the image segmentation matrix data and
%the ground truth data
clear all
load  MixtureGaussianRGBnew.mat
load('groundtruth.mat')
F_main=F;
%changing type of data 
WF=double(WF);
%initializing matrix, temp variable and feature number scored
A=[];
B=[];
S=[];
temp=0;
o=3:22;
% LDA segmentation and Scoring the result in greedy way based on o variable
for m=o;
    m
    if m~=3;
    o=o(o~=scorematrix(1,scorematrix(2,:)==temp));
    end
    scorematrix=[];
for n=m;    
   if m~=3;
   A=[S(1,:),n];
   else 
   A=n;
   end
F=F_main([1:2,A],:);
[a,b]=vl_kmeans(F(3:end,:),6);
run LDAnewfeaturegaussian.m
score=[n;Scoring(Z,WF)];
scorematrix=[scorematrix,score];

end
temp=max(scorematrix(2,:));
B=[scorematrix(1,scorematrix(2,:)==temp);temp];
S=[S,B];
end





