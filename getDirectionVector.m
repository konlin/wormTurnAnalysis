function directionVector=getDirectionVector(frame)
%allows the user to select the direction vector of the animal

imshow(frame);
hold on;
pos=zeros(2,2);
for m=1:2
    if(m==1)
        title('end point');
    else
        title('starting point');
    end        
    [x,y]=ginput(1);
    pos(m,:)=[y,x];
        plot(x,y,'dy');
    if(m==2)
        title('Click anywhere to continue');
        k = waitforbuttonpress;
    end   
end
    directionVector=[pos(2,2)-pos(1,2), pos(2,1)-pos(1,1)];
    hold off;
end