%run it on Pictures folder as the current folder and 
%load the samples result from PMLDA before running it and load
%all_superpixel too.

doc_size_width=160;
doc_size_length=160;
all=dir;
para.topic=3;
all_unordered_result=[];
for i = 1:length(samples)
all_unordered_result=[all_unordered_result;samples(i).zStar];
end

for j=1:27

ordered_result = zeros(para.topic,doc_size_width*doc_size_length);
superpixel=all_superpixel((j-1)*(25600)+1:j*25600);
unordered_result=all_unordered_result((j-1)*(25600)+1:j*25600,1:3);
unordered_result=unordered_result';
minim_spx=(j-1)*15+1;
maxim_spx=(j*15);
for k=1:para.topic
    count1=0;
    for i=minim_spx:maxim_spx
        count2=count1+sum(superpixel(:)==i); 
        ordered_result(k,(superpixel(:)==i))=unordered_result(k,(count1+1):count2);
        count1=count2;
    end
end
all_result(j).all=ordered_result;
end

%% Visualize the result
for j=1:27
figure
I=imread(all(j+2).name);
subplot(1,para.topic+1,1);title(['Image ',1]);
imagesc(I);
for i=1:para.topic % visualization of topic membership
subplot(1,para.topic+1,i+1);title(['Topic ',num2str(para.topic)]);
imagesc(reshape(all_result(j).all(i,:),[doc_size_width,doc_size_length]));
end
end
