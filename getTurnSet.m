function turnSet=getTurnSet(bodyVectors)
%gets the reorientations of the worm

axisVector=bodyVectors(:,1);
%initialize reference vector
dThetaPast=0;
%initialize previous dTheta
counter=0;
%initialize reorientation counter
index=1;    
for k=1:size(bodyVectors,3)
    dTheta=calculateAngle(bodyVectors(:,k),axisVector);
    if(abs(dTheta-dThetaPast)<5)
        counter=counter+1;
    else
         counter=0;
    end
    if(counter<40)
        turnSet(index)=[dtheta, [k-40,k]];
        axisVector=bodyVectors(:,k);
        counter=0;
        index=index+1;
    end
    dThetaPast=dTheta;
end
end
    
    
    