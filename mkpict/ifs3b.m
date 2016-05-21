% Plot the logistic map and the orbit of a point
% do not specify lambda and x0 here: it is done by an upper script
% Copyright 1999 by Todd K. Moon

t = 0:.05:1;
hold off; plot(t,logistic(t,lambda)); hold on;
ly = 0;
plot([0 min(lambda/3,1)],[0 min(lambda/3,1)],':');
for iter = 1:100
  y = logistic(x0,lambda);
  plot([x0,x0],[ly,y],'--');
  plot([x0,y],[y,y],'--');
  x0 = y;  ly = y;
end