%Input: (1) number of class so in this class 13 different hand signs
%       (2) Number of trials for each sign in this case 30  
%
function Class = targetKNN (numClass,numTrials)
Target=[1:numClass];
Class=[];

for i= 1: numClass
    Store=[];
    for j=1:numTrials
     Store(j)= Target(i);
    end
    Class=[Class Store];
end
Class;
end