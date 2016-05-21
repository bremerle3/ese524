function [h,delta] = lpfilt(fp,fs,n)
% 
% Design an optimal linear-phase filter using linear programming
%
% function [h,delta] = lpfilt(fp,fs,n)
%
% fp = pass-band frequency  (0.5=Fs/2)
% fs = stop-band frequency
% n = number of coefficients (assumed odd here)
%
% h = filter coefficients
% delta1 = pass-band ripple

% Copyright 1999 by Todd K. Moon

freqsample=50;     % number of frequencies to subdivide into
wplist = 2*pi*linspace(0,fp,freqsample);   % frequency samples in passband
wslist = 2*pi*linspace(fs,0.5,freqsample); % frequency samples in stop band
nlist = 1:(n-1)/2;
At = [];
c = [];
for w = wplist
   At = [At; 1, 2*cos(w*nlist), -1];
   c = [c; 1];
   At = [At; -1, -2*cos(w*nlist), -1];
   c = [c; -1];
end
for w = wslist
   At = [At; 1, 2*cos(w*nlist), -1];
   c = [c; 0];
   At = [At; -1, -2*cos(w*nlist), -1];
   c = [c; 0];
end
b = [0 zeros(1,(n-1)/2) -1]';
[x,value,w] = simplex1(At',b,c);
h = [w((n+1)/2:-1:2); w(1); w(2:(n+1)/2)];
delta = abs(w(end));