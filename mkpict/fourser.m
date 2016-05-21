% example Fourier series
% Copyright 1999 by Todd K. Moon

t = -.5:.001:.5;

f = 0.5*ones(size(t));    % the a0 term
N = 19;
sgn = 1;
w0 = 2*pi;
pllist = [1,5,19];
clf;
p1 = find(t < -1/4);
p2 = find(t >= -1/4 & t <= 1/4);
p3 = find(t > 1/4);
g(p1) = zeros(size(p1));  g(p2) = ones(size(p2)); g(p3)= zeros(size(p3));

plotno = 1;
for n=1:2:N
  f = f+1/(n*pi)*(2*cos(n*w0*t))*sgn;
  sgn = -sgn;
  if(find(pllist==n))
    subplot(3,2,plotno);
    plot(t,f,t,g)
    xlabel(sprintf('N=%d',(n+1)/2));
	ylabel('f(t), g_N(t)')
    subplot(3,2,plotno+1)
    plot(t,g-f)
    xlabel(sprintf('N=%d',(n+1)/2));
	ylabel('f(t) - g_N(t)')
    plotno = plotno+2;
  end
end
print -dps ../pictures/gibbs.ps
print -deps ../pictures/gibbs.eps
