function [gt, midEarCoeff] = evaluategt(gL, i, numChan)

fRange = [80, 4000];
fs = 8000;
filterOrder = 4;

phase(1:numChan) = zeros(numChan,1);
erb_b = hz2erb(fRange);
erb = erb_b(1):diff(erb_b)/(numChan-1):erb_b(2);
cf = erb2hz(erb);
b = 1.019*24.7*(4.37*cf/1000+1);

tmp_t = [1:gL]/fs;
gain = 10^((loudness(cf(i))-60)/20)/3*(2*pi*b(i)/fs).^4;
gt = gain*fs^3*tmp_t.^(filterOrder-1).*exp(-2*pi*b(i)*tmp_t).*cos(2*pi*cf(i)*tmp_t+phase(i));

if(gL==512)
    midEarCoeff = 10^((loudness(cf(i))-60)/20);
end

end




