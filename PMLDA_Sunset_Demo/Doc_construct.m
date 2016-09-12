%load the all_feature variable which is the feature resulted from feature
%processing and all_superpixel 

%Normalization 

for  i=1:5;
    feature(i,:)=normalization(feature(i,:));
end
%Document construction
maxim_spx=max(all_superpixel(:,:));
minim_spx=min(all_superpixel(:,:));
feature(:,:)=feature(:,:)*255;
for i=minim_spx:maxim_spx
    Data{i}.X=feature(:,all_superpixel==i)';
end 

%% run PMLDA
% PMLDA parameter
para.topic=3;    % number of topics
para.alpha=ones(1,para.topic);    % Prior for topic proportion pi
para.exp=0.5;          % 1/para.exp = expectation of the scaling factor s
para.iter=300;       % number of iterations for Gibbs sampling
para.muStep=eye(3);  % variance of the proposal distribution for cluster means

[samples,cluster]=pmlda_leastsquare(Data,para) %PMLDA with least square

%>>>> Uncomment to switch to gibbs sampling method <<<<%
%[samples,cluster]=pmlda_gibbs(Data,para) % PMLDA with gibbs sampling %%%
