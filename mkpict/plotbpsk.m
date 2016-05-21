% Plot the probability of error for BPSK
% Copyright 1999 by Todd K. Moon

P = []; 
snrlist = 0:.5:10;
for snr=snrlist
  EbN0 = 10^(snr/10);
  P = [P;qf(sqrt(2*EbN0))];
end
subplot(2,2,1);
semilogy(snrlist,P);
xlabel('SNR(dB) = 10 log(E_b/N_0)')
ylabel('P(E)')
set(gca,'XTick',[0,2,4,6,8,10])
axis square
print -dps ../pictures/plotbpsk.ps
print -deps ../pictures/plotbpsk.eps
