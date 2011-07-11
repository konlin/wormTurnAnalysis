function [distance]=HTdistance(pos)
%returns the distance between the head and the tail
distance=sqrt((pos(1,1)-pos(2,1))^2 + (pos(1,2)-pos(2,2))^2);
end
        