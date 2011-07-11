function pos=getTailHead(frame)
%allows the user to select the tail vector and head vector of the animal

imshow(frame);
hold on;
pos=zeros(2,2);
for m=1:2
    if(m==1)
        title('locate tail');
    else
        title('locate head');
    end        
    [x,y]=ginput(1);
    pos(m,:)=[y,x];
    if(m==1)
        plot(x,y,'sg');
    else
        plot(x,y,'sr');
    end
    if(m==2)
        title('Click anywhere to continue');
        k = waitforbuttonpress;
    end   
end
    hold off;
end
