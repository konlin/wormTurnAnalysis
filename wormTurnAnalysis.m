function [omegaTurnArray]=wormTurnAnalysis(filename)
%takes a video, picks out omega turns

video=VideoReader(filename);
numFrames=video.readerobj.NumberOfFrames;
index=1;
k=1;
while (k<numFrames)
    sentinel=999;
    while(sentinel==999 && k<=numFrames)
        frame=read(video.readerobj,k);
        imshow(frame);
        title(['Frame ', num2str(k), ' out of ',num2str(numFrames)]);
        reply = input('How many frames to skip? ');
        if(reply==0)
            sentinel=0;
        else
            if(k+reply < numFrames)
                k=k+reply;
            else
                k=numFrames;
            end
        end
    end
    pos=getTailHead(frame);
    distance=HTdistance(pos);
    if(distance<100)
        if(k > 45 && k <= numFrames-45)
            leftBuff=45;
            rightBuff=45;
        else
            if(k<45)
                leftBuff=k;
                rightBuff=45;
            else
                leftBuff=45;
                rightBuff=(numFrames-k);
            end
        end
        omegaTurnArray{index,1}=VideoReader(video.readerobj,k-leftBuff,k+rightBuff)
        omegaTurnArray{index,2}=getTurnInfo(omegaTurnArray{index,1});
        index=index+1;
        if(k+rightBuff==numFrames)
            break;
        else
            k=k+rightBuff;
        end
    end
    k=k+1;
end