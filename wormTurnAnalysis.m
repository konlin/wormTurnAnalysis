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
        reply = input('skip? ','s');
        if(reply=='y')
            skipnum = input('How many frames? ');
            if(k+skipnum < numFrames)
                k=k+skipnum;
            else
                k=numFrames;
            end
        else
            sentinel=0;
        end
    end
    pos=getTailHead(frame);
    distance=HTdistance(pos);
    if(distance<100)
        if(k > 40 && k <= numFrames-40)
            leftBuff=40;
            rightBuff=40;
        else
            if(k<40)
                leftBuff=k;
                rightBuff=40;
            else
                leftBuff=40;
                rightBuff=(numFrames-k);
            end
        end
        omegaTurnArray{index,1}=VideoReader(video.readerobj,k-leftBuff,k+rightBuff)
        omegaTurnArray{index,2}=getTurnInfo(omegaTurnArray{index,1});
        index=index+1;
        if(k+40>numFrames)
            break;
        else
            k=k+40;
        end
    end
    k=k+1;
end;