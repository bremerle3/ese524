% Plot the Rosenbrock function contours
% Copyright 1999 by Todd K. Moon

x1 = (-2.5:.05:1.5)';
x2 = (-8:.05:6)';
[X1,X2] = meshgrid(x1,x2);
Z = 100*(X2 - X1.^2).^2 + (1-X1).^2;
contour(x1,x2,Z,25);