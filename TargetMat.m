

function [targetVal]= TargetMat (Num_class,Num_sample)% Inputs the number of classifications
% Num of samples is the number of segments in each movement 
% EG HW 4 cyl_ch1 had 4x50 so 50 is the number of sectioned data for very
% clasifiers

I = eye(Num_class); % creates an Idenity matrix using the input

a=[];% a is an empy array that stores 
targetVal = [];
for i= 1:Num_class
    for j= 1: Num_sample
        a(:,j)=I(:,i);   
    end 
  targetVal = [targetVal,a];    
end
targetVal ;

end