% Plot Chebyshev polynomials
% Copyright 1999 by Todd K. Moon

t = -1:.01:1;
T0 = ones(size(t));
T1 = t;
T2 = 2*t.^2 - 1;
T3 = 4*t.^3 - 3*t;
T4 = 8*t.^4 - 8*t.^2 + 1;
T5 = 16*t.^5 - 20*t.^3 + 5*t;
%T6 = 32*t.^6 - 48*t.^4 + 18*t.^2 - 1;

clf
subplot(2,2,1)
plot(t,T0,t,T1,t,T2,t,T3,t,T3,t,T4,t,T5);
axis([-1 1 -1.2 1.2]);
axis square
t0 = 0.72;
off = 0.09;
text(t0,1+off,'n=0');
text(t0,t0+1.4*off,'1');
text(t0,2*t0^2-.9+2.7*off,'2');
text(t0,4*t0^3-2.9*t0+3.5*off,'3');
text(t0-.25,8*t0^4-8*t0^2+.85+3.5*off,'4');
%$$$ text(t0,1+off,'\itT_0');
%$$$ text(t0,t0+1.4*off,'\itT_1');
%$$$ text(t0,2*t0^2-1+2.7*off,'\itT_2');
%$$$ text(t0,4*t0^3-3*t0+3.5*off,'\itT_3');
%$$$ text(t0,8*t0^4-8*t0^2+1+3.5*off,'\itT_4');

t1 = 0.87;
text(t1+.04,16*t1^5 - 20*t1^3 + 5*t1,'5');
%$$$ text(t1+.02,16*t1^5 - 20*t1^3 + 5*t1,'\itT_5');
print -dps ../pictures/cheby1.ps
print -deps ../pictures/cheby1.eps