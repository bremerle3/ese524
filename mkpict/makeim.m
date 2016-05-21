% make a test image for tomography example
% Copyright 1999 by Todd K. Moon

scalefact = 3;
nr =20*scalefact;  nc = 20*scalefact;  % size
sqx1 = 12*scalefact;  sqx2 = 18*scalefact;
sqy1 = 12*scalefact;  sqy2 = 18*scalefact;
ccx = 6*scalefact; ccy = 6*scalefact;
r = 5*scalefact;
gsq = 150;  ming1 = 255;  maxg1 = 10;
im = 255*ones(nr,nc);
% make the square
for x = sqx1:sqx2
  for y = sqy1:sqy2
     im(x,y) = gsq;
   end
end
% make the circle
for x=ccx - r: ccx+r
  for y = ccy-r: ccy+r
    d = sqrt((x-ccx)^2 + (y-ccy)^2);
    if(d <= r)
      gr = d/r*ming1 + (1-d/r)*maxg1;
      im(x,y) = gr;
    end
  end
end

save ../data/im1 im
im8 = uint8(im);
subplot(2,2,1);
imagesc(im8);
colormap(gray);
axis image
set(gca,'XTick',[])
set(gca,'YTick',[])
print -dps ../pictures/et1.ps
print -deps ../pictures/et1.eps
im = 255*ones(nr,nc) - im;   % set so 0=black
%
et1
%
lambdac = 255*ones(nr,nc) - 255*lambda/max(max(lambda));
subplot(2,2,1);
imagesc(lambdac);
axis image
set(gca,'XTick',[])
set(gca,'YTick',[])
print -dps ../pictures/et2.ps
print -deps ../pictures/et2.eps
pause(.5)

subplot(2,2,1);
plot(y(1,:));
xlabel('Detector number')
ylabel('Detector output');
print -dps ../pictures/et3.ps
print -deps ../pictures/et3.eps

subplot(2,2,1);
plot(y(2,:));
xlabel('Detector number')
ylabel('Detector output');
print -dps ../pictures/et4.ps
print -deps ../pictures/et4.eps