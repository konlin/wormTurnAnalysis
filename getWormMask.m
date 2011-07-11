function mask=getMask(frame)

origMask=im2bw(frame,.85);
mask=(ones(size(origMask))-origMask);

%mask=imclose(mask,strel('diamond',1));
%mask=imopen(mask,strel('diamond',7));

end