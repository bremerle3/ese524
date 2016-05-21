% Test the routines to find lfsrs for data compression
% Copyright 1999 by Todd K. Moon

y = [1 1 1 0 1 0 0 1];

c1 = lfsrfind2(y,3);
c2 = dimitri3(y,3)

break;
% now run some tests
ntry = 50;

elist = [];
elist2 = [];
n=10;
m=3;
y0 = ones(1,m);
for j=1:ntry
  yr = (rand(1,n)>.5);
  y = [y0  yr];

  c1 = lfsrfind2(y,m);
  c2 = dimitri3(y,m);
  y1 = lfsr(c1,y0,n);
  y2 = lfsr(c2,y0,n);
  
  elist = [elist  sum(abs(yr - y1)) - sum(abs(yr-y2))];
end
plot(1:length(elist),elist);
avg2=sum(elist)/length(elist)

  