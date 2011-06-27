function pos=getTailHeadSet(video)
%asks the user to select the tail and the head for each frame

for k=video.firstfr:video.lastfr
    disp(strcat(num2str(k), ' out of', num2str(video.lastfr)));
    pos(:,:,k-video.firstfr+1)=getTailHead(read(video.readerobj,k));
end

end