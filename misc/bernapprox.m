% Plot Bernstein polynomials
% Copyright 1999 by Todd K. Moon

t = 0:.01:1;

subplot(2,2,1);
n = 5;
sum = 0;
for k=0:5
  plot(t,bernpoly(n,k,t));
  hold on
  sum = sum +exp(k/n)* bernpoly(n,k,t);
end
xlabel('\itt');
ylabel('\itg_{nk}(\itt), k=0,1,...,5');
print -dps ../pictures/bernpoly.ps

clf
subplot(2,2,1);
plot(t,exp(t),t,sum,'--');
xlabel('\itt');
ylabel('\ite^t and approximation');
print -dps ../pictures/bernapprox.ps