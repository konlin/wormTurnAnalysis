function [headPos,tailPos,newDirectionVector]=findTailHead(frame)
boundary=getBoundary(frame);
           
function ButtonDownFcn(src,evnt)
    if (strcmp(get(src,'SelectionType'),'alt'))
        disp('Switching...');
        temp=headIndex;
        headIndex=tailIndex;
        tailIndex=temp;
    end
    if(strcmp(get(src,'SelectionType'),'extend'))
        disp('Redefining head and tail...');
        pos=getTailHead(frame)
        headPos=pos(2);
        tailPos=pos(1);
    end
    if(strcmp(get(src,'SelectionType'),'open'))
        disp('Redefining direction...');
        newDirectionVector=getDirectionVector(frame);
    end
    plot(boundary(headIndex,2),boundary(headIndex,1),'sr');
    plot(boundary(tailIndex,2),boundary(tailIndex,1),'sg');
end
           
if(numel(boundary)<200)
    headPos=[0,0];
    tailPos=[0,0];
    newDirectionVector=[0,0];
else
    boundaryVectors=getBoundaryVectors(boundary);
    headIndex=1;
    tailIndex=1;
    for(k=1:length(boundaryVectors))
        if(k==size(boundaryVectors,1))
            angleArray(k)=calculateAngle(boundaryVectors(k,:),boundaryVectors(1,:));
        else
            angleArray(k)=calculateAngle(boundaryVectors(k,:), boundaryVectors(k+1,:));
        end
    end
        
    [pks,locs]=findpeaks(real(angleArray),'sortstr', 'descend');
    if(isempty(locs))
        headPos=[0,0];
        tailPos=[0,0];
    else
        newDirectionVector=[-999,-999];
        tailIndex=locs(2);
        headIndex=locs(1);
        hold on;
        plot(boundary(headIndex,2),boundary(headIndex,1),'sr');
        plot(boundary(tailIndex,2),boundary(tailIndex,1),'sg');
        set(gcf,'ButtonDownFcn',@ButtonDownFcn);
        headPos=boundary(headIndex,:);
        tailPos=boundary(tailIndex,:);
        pause(2);
    end
end
        
end