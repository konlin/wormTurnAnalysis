function [dTheta]=getTurnSet(bodyVectors)
%gets the reorientations of the worm

for k=1:length(bodyVectors)-2
    theta1=calculateAngle(bodyVectors(:,k),bodyVectors(:,k+1));
    theta2=calculateAngle(bodyVectors(:,k+1),bodyVectors(:,k+2));
    dTheta(k)=theta2-theta1;
end
end