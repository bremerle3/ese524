% Plot legendre polynomials
% Copyright 1999 by Todd K. Moon

t = -1:.01:1;
P0 = ones(size(t));
P1 = t;
P2 = 0.5*(3*t.^2 - 1);
P3 = 0.5*(5*t.^3 - 3*t);
P4 = .125*(35*t.^4 - 30*t.^2 + 3);
P5 = .125*(63*t.^5 - 70*t.^3 + 15*t);

clf
subplot(2,2,1)
plot(t,P0,t,P1,t,P2,t,P3,t,P4,t,P5);
axis([-1 1 -1.2 1.2]);
axis square
t0 = 0.8;
off = 0.08;
%$$$ text(t0,1+off,'\itT_0');
%$$$ text(t0,t0+1.4*off,'\itT_1');
%$$$ text(t0,.5*(3*t0^2 -1) +2.7*off,'\itT_2');
%$$$ text(t0,.5*(5*t0^3-3*t0) +3.5*off,'\itT_3');
%$$$ text(t0,.125*(35*t0^4-30*t0^2+3)   +3.5*off,'\itT_4');
%$$$ t1 = 0.87;
%$$$ text(t1,.125*(63*t0^5-70*t0^3+15*t0),'\itT_5');
text(t0,1+off,'n=0');
text(t0,t0+1.4*off,'1');
text(t0,.5*(3*t0^2 -1) +2.7*off,'2');
text(t0,.5*(5*t0^3-3*t0) +3.5*off,'3');
text(t0,.125*(35*t0^4-30*t0^2+3)   +3.5*off,'4');
t1 = 0.87;
text(t1,.125*(63*t0^5-70*t0^3+15*t0),'5');
print -deps ../pictures/legendre1.eps
