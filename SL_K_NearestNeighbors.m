
function [classification] = SL_K_NearestNeighbors (T_Samp,Target,Query_Point,k,numclass)
I = 1:numclass;%Stores the possible number of classes

Query_Point=FE_RawData(Query_Point);

DistanceFrom_QP= [];% empty arry for the distane of eacy data point to the Q.P

for i = 1:size(T_Samp,2) % numbers of columns
    SquaredDistance=0; % reset the sqared distance for the next column 
  for j= 1:size(T_Samp,1) % Number of rows
    SquaredDistance = SquaredDistance +(T_Samp(j,i)- (Query_Point(j,1)))^2; % takes the sum of the squared 
                                                                         % distance from QP of eac of the j measurememt 
  end  
  SquaredDistance = (SquaredDistance)^(1/2); % Find the square root to complete the distance formula 
  DistanceFrom_QP(i)= SquaredDistance; % stores the value in the array
end
DistanceFrom_QP;
% Make a Matrix with row of 1 with distances and row 2 with indexes
% and Sort the distance corresponging to the index number in a n by 2 matrix
D = [DistanceFrom_QP; 1:size(DistanceFrom_QP,2) ];
Distance_IndexMatrix= transpose(D) ;
Distance_IndexMatrix=sortrows(Distance_IndexMatrix);

% use the column to find the corresponding target
K_NN_Target=[];
for i= 1:k % this will take the first k number 1-k of the vertical column
Distance_IndexMatrix(i,2);    
K_NN_Target (i) = Target (Distance_IndexMatrix(i,2));  
end    
K_NN_Target
% Determining the classification of Q.P

  %Check the classification of query point by finsing
  percentage = [];
  for i= 1: length(I)
      count = 0;
    for j=1:length(K_NN_Target)
        if K_NN_Target(:,j) == I(:,i)
            count = count +1;
        end
    end
    percentage(i) = (count/length(K_NN_Target))*100;
    
  end
  
  % Finding the frequent class
       
 [M, Index] = max(percentage);
 classification = I(:,Index);









% count1=0;
% countZ=0;
% for i=1:size(K_NN_Target,2)
%   
%     if K_NN_Target(i)== 1
%        count1=count1+1;
%     else 
%         countZ= countZ+ 1;
%     end
% end
% count1;
% countZ;
% 
% if count1== countZ
% classification='Null';
% else if count1 > countZ        
% classification =1;
%     else
%     classification =0;    
%     end        
% end

end