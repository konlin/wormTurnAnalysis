function boundaryVectors=getBoundaryVectors(boundary)

for(k=1:size(boundary,1))
    if(k==size(boundary,1))
        boundaryVectors(k,:)=boundary(1,:)-boundary(k,:);
    else
        boundaryVectors(k,:)=boundary(k+1,:)-boundary(k,:);
    end
end
end
    
    