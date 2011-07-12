function [distance]=getHTdistanceSet(headPos,tailPos)

for k=1:length(headPos)
    distance(k)=sqrt((headPos(k,1)-tailPos(k,1))^2+(headPos(k,2)-tailPos(k,2))^2);
end
