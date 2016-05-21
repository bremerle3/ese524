% Make an ill-conditioned matrix of sinusoids.
% Copyright 1999 by Todd K. Moon

% 
% set up before calling:
% deltaf
% N
% fmax
%

T = 1/(2*fmax);
deltat = 4*T/(N+1);
wmax = 2*pi*fmax;
deltaw = 2*pi*deltaf;
clear f;
clear t;

for i=1:N
   t(i) = (i-1)*deltat;
   for j=1:N
      f(i,j) = cos((wmax - deltaw*(j-1))*t(i));
   end
end
