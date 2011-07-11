function boundary=getBoundary(frame)

BW=getWormMask(frame);
bndries=bwboundaries(BW,'noholes');
bndry=zeros(1,2);
for k=1:length(bndries)
    if size(bndries{k},1)>size(bndry,1)
        bndry=bndries{k};
    end %if
end %for k
n=size(bndry,1);
filt=normpdf((1:n),n/2,.01*n);
filt=filt/sum(filt);
bndry=[bndry;bndry(1:n,:)];
bnd=filter(filt,1,bndry);
boundary=bnd(n+1:end,:);
imagesc(frame);
hold on;
for k = 1:length(bndries)
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
end