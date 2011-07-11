function [pos,bodyVectors,turnSet]=findOmegaTurns(video)
%extracts the omega turns from a video given a set of body vectors

[headPos,tailPos]=getTailHeadSet(video);
bodyVectors=getBodyVectorSet(headPos,tailPos);
turnSet=getTurnSet(bodyVectors);
pos=[headPos,tailPos];

end