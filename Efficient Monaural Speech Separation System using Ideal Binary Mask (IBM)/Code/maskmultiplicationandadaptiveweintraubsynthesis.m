function rs = maskmultiplicationandadaptiveweintraubsynthesis(gns, winLength, midEarCoeff, gt512, mask ) 

[numChan, numFrame] = size(mask);

sigLength = length(gns);
winShift = winLength/2;     
increment = winLength/winShift;     
rs = zeros(1,sigLength);
      
temp1 = gns;


for i = 1:winLength    
    coswin(i) = (1 + cos(2*pi*(i-1)/winLength - pi))/2;
end

% for c = 1:numChan
%     weight = zeros(1, sigLength);      
%     for m = 1:numFrame-increment/2+1                
%         startpoint = (m-1)*winShift;
%         if m <= increment/2               
%             weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + mask(c,m).*coswin(winLength/2-startpoint+1:end);
%         else 
%             weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + mask(c,m)*coswin;
%         end
%     end
% 
%     temp1(c,:) = gns(c,:).*weight;
%     
%     temp1(c,:) = fliplr(temp1(c,:))/midEarCoeff(c);  
%     
%     if (c>14)
%     gt128(c,:) = evaluategt(128,c, numChan);
%     temp2 = fftfilt(gt128(c,:),temp1(c,:));
%     temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    
% %     elseif ((z(c)>20)&&(z(c)<50))
% %     gt256(c,:) = evaluategt(256,c, numChan);
% %     temp2 = fftfilt(gt256(c,:),temp1(c,:));
% %     temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c); 
%     else
%     temp2 = fftfilt(gt512(c,:),temp1(c,:));
%     temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);        
%     end
%     
%     rs = rs + temp1(c,:);
% end

for c = 1:numChan
%     temp1(c,:) = fliplr(temp1(c,:))/midEarCoeff(c);    % time reverse filter output & normalize out mid-ear coefficients
%     temp2 = fftfilt(gt(c,:),temp1(c,:));    % second pass filtering via FFTFILT
%     temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    % time reverse again & normalize out mid-ear coefficients
    temp1(c,:) = fliplr(temp1(c,:))/midEarCoeff(c);
    if (c>14)
    gt128(c,:) = evaluategt(128,c, numChan);
    temp2 = fftfilt(gt128(c,:),temp1(c,:));
    temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    
%     elseif ((z(c)>20)&&(z(c)<50))
%     gt256(c,:) = evaluategt(256,c, numChan);
%     temp2 = fftfilt(gt256(c,:),temp1(c,:));
%     temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c); 
    else
    temp2 = fftfilt(gt512(c,:),temp1(c,:));
    temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);        
    end
    weight = zeros(1, sigLength);       % calculate weighting
    for m = 1:numFrame-increment/2+1      % mask value can be binary or rational           
        startpoint = (m-1)*winShift;
        if m <= increment/2                % shorter frame lengths for beginning frames or zero padding
            weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + mask(c,m)*coswin(winLength/2-startpoint+1:end);
        else 
            weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + mask(c,m)*coswin;
        end
    end
    
    rs = rs + temp1(c,:).*weight;
end











