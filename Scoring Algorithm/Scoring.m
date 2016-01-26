%Scoring function is used to find the best matching score between two
%images which in this case used for matching between groundtruth and the
%segmentation of LDA

%Explanation of variable:
%-v= number of unique topic in LDA result
%-P= permutation of v
%-r,c are the row and the columns size of P
%-scorematrix is the variable used to keep all the matching result based on
% the permuatation of the topic
%-Z is the LDA result
%-WF is the groundtruth
%-result is the best score of the matching

function [result]=Scoring(Z,WF)
v=unique(Z);
P=perms(v);
[r,c]=size(P);
scorematrix=[];
score=[];
ZZ = Z;
for m = 1:r
    
    ZZ(Z == 1) = P(m,1);
    ZZ(Z == 2) = P(m,2);
    ZZ(Z == 3) = P(m,3);
    ZZ(Z == 4) = P(m,4);
    ZZ(Z == 5) = P(m,5);
    ZZ(Z == 6) = P(m,6);
    score=[1-Error(ZZ,WF,128000);m];
    scorematrix=[scorematrix,score];
    result=max(scorematrix(1,:));  
end
end


    



