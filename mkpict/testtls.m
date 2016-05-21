% Test tls stuff
% Copyright 1999 by Todd K. Moon

Ab =[1 2 4 5 7; 
	 3 4 5 5 2;
	 5 6 7 2 4
	 6 2 6 2 5;
	 2 5 2 4 6];
[U,S,V] = svd(Ab);
Abnew = U(:,1)*V(:,1)'*S(1,1) + U(:,2)*V(:,2)'*S(2,2);
%$$$ A = Abnew(:,1:4);  b = Abnew(:,5);
%$$$ x = tls(A,b)

x0=[.0689;.8926]; x1=[.2926;.3016]; x2=[.5401;1.989]; x3=[.536;.6189];
x4=[.8275;3.3191]; x5=[1.7336;4.5681]; x6=[1.506;2.8487];
u = [.0351 .501 .1561 .7533 .8993 .2287 ];
A = [x0(1) x0(2) 0     0     u(1) 0
	 0     0     x0(1) x0(2) 0    u(1)
	 x1(1) x1(2) 0     0     u(2) 0
	 0     0     x1(1) x1(2) 0    u(2)
	 x2(1) x2(2) 0     0     u(3) 0
	 0     0     x2(1) x2(2) 0    u(3)
	 x3(1) x3(2) 0     0     u(4) 0
	 0     0     x3(1) x3(2) 0    u(4)
	 x4(1) x4(2) 0     0     u(5) 0
	 0     0     x4(1) x4(2) 0    u(5)
	 x5(1) x5(2) 0     0     u(6) 0
	 0     0     x5(1) x5(2) 0    u(6)];
b = [x1(1);x1(2); x2(1);x2(2); x3(1);x3(2); x4(1);x4(2); x5(1);x5(2); ...
		 x6(2);x6(2)];
a = tls(A,b);
clf
t = A*a;
n = length(b);
xax = (1:n/2)-1;
subplot(2,2,1);
plot(xax,b(1:2:n),'b-',xax,t(1:2:n),'b:',xax,b(2:2:n),'b-',xax,t(2:2:n),'b:')
xlabel('t')
ylabel('state')
axis([0 5 0 5])
print -dps ../pictures/tlsest1.ps
print -deps ../pictures/tlsest1.eps

input('press return to continue')
% return

% ptls
Abnew = U(:,1)*V(:,1)'*S(1,1) + U(:,2)*V(:,2)'*S(2,2)+U(:,3)*V(:,3)'*S(3,3);
X = [2 3 2 6 -2; -4 3 -2 6 2; -6 -3 -2 5 -2; -2 -1 2 0 8; -5 6 0 -2 -7; ...
	 5 4 6 2 -5; 1 0 1 -1 20; -2 -3 -4 -5 -66; -6 7 -3 2 100];

X = [1 .1 -2.1
	 1 1.1 -4.9
	 1 1.9 -8.1
	 1 3.1 -10.9
	 1 4 -13.9];
% [x,Ahat,bhat] = ptls1(X(:,1:2),-X(:,3),1)
A = X(:,1:2);  b = -X(:,3);

x = (0:10)';
n = length(x);
y = 3*x + 2 + 3*randn(n,1);
x = x+3*randn(n,1);
minx = min(x); maxx = max(x);
clf
subplot(2,2,1)
plot(x,y,'o')
xlabel('x')
ylabel('y')
A = [ones(n,1) x];
b = y;
xls= pinv(A)*b;
als = xls(2);
bls = xls(1);
k1 = 1; k2 = 1;
x = ptls2(A,b,k1,k2);

a = x(2); b = x(1);
x = minx:.2:maxx;
ywls = a*x + b;
yls = als*x + bls;
hold on;
plot(x,ywls,'-',x,yls,':');
xlabel('x'); ylabel('y');
print -dps ../pictures/ptls1.ps
print -deps ../pictures/ptls1.eps


%$$$ A = [1 1;
%$$$ 	 1 2.1
%$$$ 	 1 2.9];
%$$$ b = [7;11.2;14.8];
%$$$  
%$$$ xpts = A(:,2);
%$$$ ypts = b;
%$$$ k1 = 1; k2 = 1;
%$$$ x = ptls2(A,b,k1,k2)

A = [1 2 0
	 1 2 1.1
	 1 2 1.9
	 1 2 3.1
	 1 2 4.1];
b = [8; 12.1; 15.9; 20.1; 24.2];
k1 = 1; k2 = 2;
x = ptls2(A,b,k1,k2)
A*x

return
%$$$ r = 2;
%$$$ X1 = X(:,1:1);
%$$$ [p,k] = size(X1);
%$$$ X2 = X(:,2:end);
%$$$ [m,n] = size(X);
%$$$ lx = rank(X);
%$$$ [qx,rx] = qr(X);
%$$$ q1 = qx(:,1:k); q2 = qx(:,k+1:lx); q3 = qx(:,lx+1:end);
%$$$ R11 = rx(1:k,1:k); 
%$$$ R12 = rx(1:k,k+1:end); 
%$$$ R22=rx(k+1:lx,k+1:end);
%$$$ l = rank(X);
%$$$ Px = qx(:,1:l)*qx(:,1:l)';
%$$$ l = rank(X1);
%$$$ if(l <= r)
%$$$   Pxperp = eye(size(Px))-Px;
%$$$   t = Pxperp*X2;
%$$$   [u,s,v] = svd(R22);
%$$$   d = r-l;
%$$$   s(d+1:end,d+1:end) = 0;
%$$$   Hp = u*s*v';
%$$$   X2hat = q1*R12 + q2*Hp;
%$$$   Xhat = [X1 X2hat];
%$$$ else
%$$$   error('Cannot satisfy rank requirements\n');
%$$$ end
%$$$ A = Xhat(:,1:2);
%$$$ b = -Xhat(:,3)




