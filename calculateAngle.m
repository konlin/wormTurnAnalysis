function angle=calculateAngle(vector1, vector2)
%determines the angle between two vectors
CosTheta = dot(vector1,vector2)/(norm(vector1)*norm(vector2));
angle = (acos(CosTheta)*180/pi);
end