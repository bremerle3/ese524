% Demonstrate newton's stuff on Rosenbrocks function
% Copyright 1999 by Todd K. Moon

hold off 
rosenbrock;
hold on
xoff = -.3;
x = [-2;5];
l = 'x^{[0]}';
text(x(1)+xoff,x(2),l);
xn = zeros(2,1);
for i=1:8
  hess = [1200*x(1)^2 - 400*x(2) + 2  -400*x(1);
          -400*x(1)                   200];
  grad = [-400*x(1)*(x(2) - x(1)^2) + 2*(x(1)-1);
          200*(x(2) - x(1)^2)];
  xn = x - hess\grad;
  plot([x(1) xn(1)],[x(2) xn(2)])
  if i < 4
    l = ['x^{[' num2str(i) ']}'];
    text(xn(1)+xoff,xn(2),l);
  end
  x = xn;
end
l = 'x^*';
text(xn(1)+.03,xn(2),l);
xlabel('x_1');
ylabel('x_2');
print -dps ../pictures/rosenbrock1.ps
print -deps ../pictures/rosenbrock1.eps