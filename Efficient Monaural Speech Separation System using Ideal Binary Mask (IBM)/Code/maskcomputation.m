function mask = maskcomputation(gs, gn, winLength)

cs = cochleagram(gs, winLength); 
cn = cochleagram(gn, winLength);
[numChan, numFrame] = size(cs);
mask = zeros(size(cs));
LC = 0;
for c = 1:numChan
    
    for m = 1:numFrame
        mask(c,m) = cs(c,m) >= cn(c,m)*10^(LC/10);
    end
    
end