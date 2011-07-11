function [headPos,tailPos]=getTailHeadSet(video)
%asks the user to select the tail and the head for each frame

vid=VideoReader(video);
for k=vid.firstfr:vid.lastfr
    disp(strcat(num2str(k), ' out of', num2str(vid.lastfr)));
    %pos(:,:,k-video.firstfr+1)=getTailHead(read(video.readerobj,k));
    [headPos(k,:),tailPos(k,:)]=findTailHead(read(vid.readerobj,k));
end

end