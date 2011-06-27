function omegaTurns=findOmegaTurns(bodyVectors)
%extracts the omega turns from a video given a set of body vectors

axisVector=bodyVectors(:,1);
%set up a reference vector

for k=1:size(bodyVectors,3)
    anglesArray(:,k)=calculateAngle(axisVector,bodyVectors(:,k));
    if(k~=1)
        if(anglesArray(:,k)-anglesArray(:,k-1)>
        