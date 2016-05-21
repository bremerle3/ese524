% find an affine transformation Ax + b that transforms from
% {x00,x10,x20} to {x01,x11,x21}
% Copyright 1999 by Todd K. Moon

x00 = [1;1];  x10 = [2;1];  x20 = [2;2];
x01 = [1.2;1];   % from (1,1)
x11 = [1.7;1.2];   % from (2,1)
x21 = [1.5;1.7];   % from (2,2)


X = [x00(1) x00(1) 0      0      1 0
	 0      0      x00(1) x00(1) 0 1
	 x10(1) x10(2) 0      0      1 0
	 0      0      x10(1) x10(2) 0 1
	 x20(1) x20(2) 0      0      1 0
	 0      0      x20(1) x20(2) 0 1];
y = [x01(1); x01(2);  x11(1); x11(2);   x21(1); x21(2)];
x = X\y;

A = reshape(x(1:4),2,2)';
b = x(5:6);

subplot(2,2,1)
plot([x00(1),x10(1)],[x00(2),x10(2)]);
hold on;
plot([x10(1),x20(1)],[x10(2),x20(2)]);
plot([x20(1),x00(1)],[x20(2),x00(2)]);

plot([x01(1),x11(1)],[x01(2),x11(2)]);
plot([x11(1),x21(1)],[x11(2),x21(2)]);
plot([x21(1),x01(1)],[x21(2),x01(2)]);
axis('equal')
axis([0 3 0 3]);
print -deps ../pictures/ex143.eps
