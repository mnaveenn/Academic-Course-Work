function rs = maskmultiplicationandsynthesis(gns, winLength, midEarCoeff, gt, mask ) 

[numChan, numFrame] = size(mask);

sigLength = length(gns);
winShift = winLength/2;     
increment = winLength/winShift;     
rs = zeros(1,sigLength);
      
temp1 = zeros(numChan, sigLength);


for i = 1:winLength    
    coswin(i) = (1 + cos(2*pi*(i-1)/winLength - pi))/2;
end

for c = 1:numChan
    weight = zeros(1, sigLength);      
    for m = 1:numFrame-increment/2+1                
        startpoint = (m-1)*winShift;
        if m <= increment/2               
            weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + mask(c,m).*coswin(winLength/2-startpoint+1:end);
        else 
            weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + mask(c,m)*coswin;
        end
    end
    
    temp1(c,:) = gns(c,:).*weight;
    
    temp1(c,:) = fliplr(temp1(c,:))/midEarCoeff(c);   
    temp2 = fftfilt(gt(c,:),temp1(c,:));   
    temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    
    
    rs = rs + temp1(c,:);
end













