% Test Cadzow's results on the sinusoidal modeling
% Copyright 1999 by Todd K. Moon

N=128;                        % number of points
fftlen=2048;
f = 0:.5/(fftlen/2):.49999;
a1 = 15; a2 = 10;             % signal amplitudes
p = 4;                        % two real sinusoids
w1 = 0.15*pi;  w2 = 0.68*pi;  % signal frequencies
var = 112.5;                    % noise variance

t=(1:N)';
xclean = a1*cos(w1*t) + a2*cos(w2*t);
x = xclean + sqrt(var)*randn(N,1);

m = p;
% Make the forward and backward data matrices
Xf = zeros(N-m,m+1);
Xb = zeros(N-m,m+1);
for i=1:N-m
  for j=1:m+1
    Xf(i,j) = x(m+i-j+1);
    Xb(i,j) = x(i+j-1);
  end
end
X = [Xb;Xf];
[X,nlist] = tohanktoep(X,p);
% now pull out the data
xcleaned(1:N-m) = X(1:N-m,1);
xcleaned(N-m+1:N) = X(N-m,2:m+1)'
 
xcleanfft = fft(xclean,fftlen);
xfft = fft(x,fftlen);
xcleanedfft = fft(xcleaned,fftlen);
clf;
subplot(2,2,1);
plot(f,abs(xcleanfft(1:fftlen/2)));
axis([0 0.5 0 1000]);
set(gca,'XTick',[0 .1 .2 .3 .4 .5])
xlabel('normalized frequency')
ylabel('|X[k]|')
print -dps ../pictures/compmap31.ps
print -deps ../pictures/compmap31.eps
% text(.25,-280,'(a)','HorizontalAlignment','center');
pause(1)

clf; subplot(2,2,1); 
% subplot(2,2,2);
plot(f,abs(xfft(1:fftlen/2)));
axis([0 0.5 0 1000]);
set(gca,'XTick',[0 .1 .2 .3 .4 .5])
xlabel('normalized frequency')
ylabel('|X[k]|')
print -dps ../pictures/compmap32.ps
print -deps ../pictures/compmap32.eps
% text(.25,-280,'(b)','HorizontalAlignment','center');
pause(1)

clf; subplot(2,2,1);
% subplot(2,2,3);
plot(0:length(nlist)-1,nlist);
xlabel('iteration')
ylabel('||X-Xnew||^2')
set(gca,'XTick',[0 10 20 30 40]);
print -dps ../pictures/compmap33.ps
print -deps ../pictures/compmap33.eps
% text(20,-48,'(c)','HorizontalAlignment','center');
pause(1)

clf; subplot(2,2,1);
% subplot(2,2,4);
plot(f,abs(xcleanedfft(1:fftlen/2)));
axis([0 0.5 0 1000]);
set(gca,'XTick',[0 .1 .2 .3 .4 .5])
xlabel('normalized frequency')
ylabel('|X[k]|')
print -dps ../pictures/compmap34.ps
print -deps ../pictures/compmap34.eps
%text(.25,-280,'(d)','HorizontalAlignment','center');