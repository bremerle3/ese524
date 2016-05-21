function myplaysnd(y,fs)
% 
% Modified and simplified from playsnd, to make the sample rate stuff work

% PLAYSND Implementation 
%   MYPLAYSND(Y,FS)
%
% y = data to play
% fs = sample rate

% Copyright 1999 by Todd K. Moon

if(nargin==1)
  fs = 11025;
end
t = clock;
tmpfile = ['/tmp/au' sprintf('%02.0f%02.0f%02.0f', t(4:6))];
fp = fopen(tmpfile,'wb');
if fp==-1,
  error(['Cannot open ' tmpfile ' with write privilege.'])
end
my = min(y);  My = max(y);

fwrite(fp, floor( 255*(y+my)/(My-my) + .5),'uchar');
fclose(fp);
str = ['!play ' sprintf('%d',fs) ' ' tmpfile];
eval(str)
delete(tmpfile);
