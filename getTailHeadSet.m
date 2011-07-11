function [headPos,tailPos]=getTailHeadSet(video)
%asks the user to select the tail and the head for each frame

vid=VideoReader(video);
for k=1:vid.NumberOfFrames
    disp(strcat(num2str(k), ' out of', num2str(vid.NumberOfFrames)));
    [headPos(k,:),tailPos(k,:)]=findTailHead(read(vid,k));
end

end