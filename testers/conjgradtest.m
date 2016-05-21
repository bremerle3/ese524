% Test the conjugate gradient algorithm
% Copyright 1999 by Todd K. Moon

hold off 
; rosenbrock;
hold on
xoff = -.3;
x = [-1;-1];

[xn,X] = conjgrad2(x,'rosengrad','rosenhess')
[n,k] = size(X);
l = 'x0';
text(X(1,1)+xoff,X(2,1),l);
for i=1:k-1
  plot([X(1,i) X(1,i+1)],[X(2,i+1) X(2,i+1)])
  if i < 4
    l = ['x' num2str(i+1)];
    text(X(1,i+1)+xoff,X(2,i+1),l);
  end
end
%$$$ l = 'x*';
%$$$ text(xn(1)+.03,xn(2),l);
%$$$ xlabel('x1');
%$$$ ylabel('x2');