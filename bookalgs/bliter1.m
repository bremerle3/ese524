% Iterate on bandlimited data using two projections

% Copyright 1999 by Todd K. Moon

% Before calling, set up:
% g = available data
% nsamp = number of sample points
% N = number of points in FFT
% b = bandlimit of data

f = g;                               % initial point, g=available data
while 1
  fold = f;
  F = fft(f,N);                      % enforce the bandlimited constraint
  F(b+1:N-(b-1)) = zeros(N-2*b+1,1);
  f = real(ifft(F,N));           
  f(1:nsamp) = g(1:nsamp);           % make f match g over sample interval
  f(N:-1:N-nsamp+2) = g(N:-1:N-nsamp+2); % (positive and negative time)
  if(norm(f -fold) < 1.e-3)          % stop if little change
    break;
  end
end