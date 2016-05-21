% a sequence with a linear complexity of 5
% Copyright 1999 by Todd K. Moon

% y = [1     1     1     1     0     0     1     1     0     1];
y = [0 1 0 0 1 1 0 1 0 1 0]
%y = [0 1 0 1 1 1 0]
c = massey(y);

y = y(:);
n = length(y);
m = 3;
A = [];
for i=1:m
  yc = y(i:n-m+i-1);
  A = [yc A];
end
b = y(m+1:n);

% The least-squares attempt
%$$$ X = A'*A;
%$$$ X = mod(abs(round(det(X)*inv(X))),2);
%$$$ c1 = mod(X*A'*b,2)'

c1 = lfsrfind(A,b);
c2 = dimitri2(A,b);

% now run some tests
ntry = 50;

elist = [];
elist2 = [];
n=10;
m=3;
for j=1:ntry
  y = (rand(n,1)>.5);
  A = [];
  for i=1:m
	yc = y(i:n-m+i-1);
	A = [A yc];
  end
  b = y(m+1:n);

  X = A'*A;
  X = mod(abs(round(det(X)*inv(X))),2);
  c3 = mod(X*A'*b,2);

  c1 = lfsrfind(A,b);
  c2 = dimitri2(A,b);
  b1 = mod(A*c1,2);
  b2 = mod(A*c2,2);
  b3 = mod(A*c3,2);
  
  elist = [elist  sum(abs(b-b1)) - sum(abs(b-b2))];
  elist2 = [elist2  sum(abs(b-b3)) - sum(abs(b-b2))];
end
plot(1:length(elist),elist,1:length(elist2),elist2)
avg2=sum(elist)/length(elist)
avg2=sum(elist2)/length(elist2)
  