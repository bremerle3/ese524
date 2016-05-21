% Demonstrate steepest descent on Rosenbrocks function
% Copyright 1999 by Todd K. Moon

hold off 
rosenbrock;
hold on
xoff = -.15;
x = [-1;0];
l = 'x0';
alpha = 0.0008;

% text(x(1)+xoff,x(2),l);
xn = zeros(2,1);
for i=1:10000
  grad = [-400*x(1)*(x(2) - x(1)^2) + 2*(x(1)-1);
	      200*(x(2) - x(1)^2)];
  xn = x - alpha * grad;
  plot([x(1) xn(1)],[x(2) xn(2)],'w')
%$$$   if i < 4
%$$$ 	l = ['x' num2str(i)];
%$$$ 	text(xn(1)+xoff,xn(2),l);
%$$$   end
  x = xn;
end
%$$$ l = 'x*'
%$$$ text(xn(1)+.03,xn(2),l);
%$$$ xlabel('x1');
%$$$ ylabel('x2');
