function bodyVectors=getBodyVectorSet(pos)
%calculates body vectors from tail-head positions

for k=1:size(pos,3)
    bodyVectors(:,k)=pos(1,:)-pos(4,:);
end
end

    