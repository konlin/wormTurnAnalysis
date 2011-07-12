function [headPos,tailPos]=getTailHeadSet(video,varargin)
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
    [headPos(k,:),tailPos(k,:)]=findTailHead(read(vid,k));
end

end