function [turnAngle]=getTurnInfo(video)
%returns the tail angle, distance between head and tail, and turn side

video.play;
firstfr=read(video.readerobj,video.firstfr);
lastfr=read(video.readerobj,video.lastfr);
%gets the first and last frame numbers

firstpos=getTailHead(firstfr);
lastpos=getTailHead(lastfr);
%gets head/tail position

firstBodyVec=firstpos(1,:)-firstpos(2,:);
lastBodyVec=lastpos(1,:)-lastpos(2,:);
%calculates their respective vectors



CosTheta = dot(firstBodyVec,lastBodyVec)/(norm(firstBodyVec)*norm(lastBodyVec));
turnAngle = 180 - (acos(CosTheta)*180/pi);
%calculates angle

video.play;
reply=input('add 180 degrees? ', 's');
if(reply=='y')
    turnAngle=180+turnAngle;
else
    turnAngle=turnAngle;
end
%if the animal's body exceeds 180 degrees, correct it
end