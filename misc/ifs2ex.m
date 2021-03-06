% find an affine transformation Ax + b that transforms from
% {x00,x10,x20,x30} to {x01,x11,x21,x31}
% Copyright 1999 by Todd K. Moon


%x00 = [1;1];  x10 = [2;1];  x20 = [2;2];  x30 = [1;2];
x00 = [0;0];   x10 = [1;0];  x20 = [1;1];  x30 = [0;1];


b = x00;

% list of points that are moved to
x1 = [.1;.02];   % from (0,0)
x2 = [.98;.2];   % from (1,0)
x3 = [.02;.9];   % from (0,1)

B = x1;
a = x2(1) - B(1);
c = x2(2) - B(2);

b = x3(1) - B(1);
d = x3(2) - B(2);

A = [a b; c d];
sq = [0 1 1 0;
      0 0 1 1];
subplot(2,2,1)

hold off;
for iter = 1:30
  for i=1:4
    ni = i+1;
    if(ni > 4)
      ni = 1;
    end
    plot([sq(1,i),sq(1,ni)],[sq(2,i),sq(2,ni)])
    axis('equal');
    hold on
  end
  for i=1:4
    sq(:,i) = A*sq(:,i) + B;
  end
end
axis([-1 1.5 -1 1.5])