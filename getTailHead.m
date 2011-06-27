function pos=getTailHead(frame)
%allows the user to select the tail vector and head vector of the animal
NUMOFPOINTS=4;

imshow(frame);
hold on;
pos=zeros(NUMOFPOINTS,2);
for m=1:NUMOFPOINTS
    if(m==1)
        title('define tail vector');
    else
        if(m==3)
            title('define head vector');
        end
    end        
    [x,y]=ginput(1);
    pos(m,:)=[y,x];
    if(m==1||m==2)
        plot(x,y,'sg');
    end
    if(m==3||m==4)
        plot(x,y,'sr');
    end
    if(m==NUMOFPOINTS)
        title('Click anywhere to continue');
        k = waitforbuttonpress;
    end   
end
    hold off;
end
