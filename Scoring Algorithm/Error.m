

%Function to find the error differences of the two vectors 
function [error_percent]=Error(vector1,vector2,num_of_data)
result=[];
for n=1:num_of_data;
    if(vector1(n)== vector2(n))
        result=[result,0];    
    else result=[result,1];
    end
end
error_percent=sum(result)/num_of_data;
        