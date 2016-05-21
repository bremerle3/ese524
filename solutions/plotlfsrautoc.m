function plotlfsrautoc(y)
% plot the autocorrelation of the output of an LFSR
% Copyright 1999 by Todd K. Moon

N = length(y);
yf = fft(y);
yrf = fft(y(N:-1:1));					% time-reversed
zf = yf .* yrf;							% multiply
z = real(ifft(zf));
% now shift, so the zero lag is in the middle
x = [z(N- (N-1)/2:N) z(1:(N-1)/2)]
subplot(2,2,1);
plot(0:N-1, x)
set(gca,'XTickLabel',[-(N-1)/2:(N-1)/2]);
xlabel('lag')
ylabel('cyclic autocorrelation')
