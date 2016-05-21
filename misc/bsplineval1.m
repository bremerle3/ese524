function s = bsplineval1(c,t,x,k)
% 
% When f(x) = sum_i c_i^k B_i^k(x)
% where B_i^k is the kth order spline across t_i,t_{i+1},\ldots,t_{i+k+1}
% This function evaluates f(x) for a given x.
% (See Kincaid-Cheney, p. 396)
%
% function s = bsplineval1(c,t,x,k)
%
% c = set of coefficients
% t = knot set
% x = value.  x must fall in range of knots, t_i <= x < t_{i+1}
% k = order
%
% s = spline value

% Copyright 1999 by Todd K. Moon

nt = length(t);
nc = length(c);
m = sum(x>=t);
if(m == nt | m <= 0)
  error('x must be in range of knots')
end

car = [];
for i=m:-1:(m-k)
  if(i>nc)
    c0 = 0;
  elseif(i<1) 
    c0 = 0;
  else
    c0 = c(i);
  end
  car = [car; c0];
end

k1 = k;
for j=k-1:-1:0
  for i=1:k1
     if(m-i+1 <=0)
       t0 = 0;
     else
       t0 = t(m-i+1);
     end
     if(m-i+j+2 > nt)
       tn = t(nt)+1;
     else
       tn = t(m-i+j+2);
     end
     cnew(i) = ((x-t0)*car(i) + (tn-x)*car(i+1))/(tn-t0);
  end
  k1=k1-1;
  car = cnew;
end
s = car(1);