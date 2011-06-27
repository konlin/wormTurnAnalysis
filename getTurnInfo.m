function [turnAngle]=getTurnInfo(video)
%returns the tail angle, distance between head and tail, and turn side

firstfr=read(video.readerobj,video.firstfr);
lastfr=read(video.readerobj,video.lastfr);
%gets the first and last frame numbers

firstpos=getTailHead(firstfr);
lastpos=getTailHead(lastfr);
%gets head/tail position

firstBodyVec=firstpos(1,:)-firstpos(4,:);
lastBodyVec=lastpos(1,:)-lastpos(4,:);
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