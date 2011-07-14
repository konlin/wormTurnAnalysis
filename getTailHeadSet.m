function [headPos,tailPos,directionVectorSet, angleSet]=getTailHeadSet(video,varargin)
%asks the user to select the tail and the head for each frame

vid=VideoReader(video);
firstFrame=1;
lastFrame=vid.NumberOfFrames;
if(length(varargin)==2)
    firstFrame=varargin{1}
    lastFrame=varargin{2}
end
for k=firstFrame:lastFrame
    disp(strcat(num2str(k), ' out of', num2str(lastFrame)));
    [headPos(k,:),tailPos(k,:),directionVectorSet(k,:)]=findTailHead(read(vid,k));
    if(directionVectorSet(k,:)==[-999,-999])
        if(k==firstFrame)
            directionVectorSet(firstFrame,:)=getDirectionVector(read(vid,firstFrame));
        else
            directionVectorSet(k,:)=directionVectorSet(k-1,:)
        end
    end
    if (k~=firstFrame)
        angleSet(k-firstFrame)=calculateAngle(directionVectorSet(k,:), directionVectorSet(k-1,:));
    end
end

end