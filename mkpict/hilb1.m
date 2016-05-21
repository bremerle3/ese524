% Program to generate the data for the hilbert approximation to
% the exponential function

% Copyright 1999 by Todd K. Moon

x=0:0.01:1;
% regular L2 
G = hilb(3);
e = exp(1);
b = [e-1;1;e-2];
a = G\b;
ar = a(length(a):-1:1);

% Taylor series
a2 = [0.5;1;1];

% Weighted norm
t = sqrt(5/2);
G = [0.5*t  t/4      3*t/16
     t/4    3*t/16   5*t/32
     3*t/16 5*t/32   13*t/96];
b = [1.38603; 0.860513; 0.690724];
aw = G\b;
aw = aw(length(aw):-1:1);

ear = exp(x) - polyval(ar,x);
eaw = exp(x) - polyval(aw,x);
ea2 = exp(x) - polyval(a2,x);

% ar: least-squares  (yellow)
% a2: Taylor         (red)
% aw: Weighted       (cyan)

%plot(x,exp(x)-polyval(ar,x),'y',x,exp(x)-polyval(aw,x),'c',x,exp(x)-polyval(a2,x),'r')
clf
subplot(2,2,1);
semilogy(x,abs(ear),'-',x,abs(eaw),'-.',x,abs(ea2),':')
legend('Least-squares','Weighed least-squares','Taylor')
xlabel('t')
ylabel('absolute error')

% ar: least squares (yellow)
% aw: weighted (cyan)

%plot(x,exp(x)-polyval(ar,x),'y',x,exp(x)-polyval(aw,x),'c')