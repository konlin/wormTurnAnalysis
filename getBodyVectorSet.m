function bodyVectors=getBodyVectorSet(headPos,tailPos)
%calculates body vectors from tail-head positions

for k=1:length(headPos)
    bodyVectors(:,k)=headPos(k,:)-tailPos(k,:);
end
end

    