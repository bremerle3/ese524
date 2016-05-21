% 
% Plot the chi-squared r.v.
% Copyright 1999 by Todd K. Moon

x = 0:.1:10;
clf
subplot(2,2,1);
for n=1:2:10
  n
  plot(x,chi2(x,n));
  hold on
end
xlabel('z')
ylabel('f_Z(z)')