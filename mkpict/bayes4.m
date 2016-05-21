% show the decision regions for a 3-way test

% Copyright 1999 by Todd K. Moon

m0 = [4;4];
m1 = [-2;-2];
m2 = [2;-5];
m3 = [1;-1];
p0 = 1/4;
p1 = 1/4;
p2 = 1/4;
p3 = 1/4;
%$$$ p0 = 99/100;
%$$$ p1 = 1/300;
%$$$ p2 = 1/300;
%$$$ p3 = 1/300;

M = [m0 m1 m2 m3];
X = M(1,:);
Y = M(2,:);
set(gcf,'DefaultLineLineWidth',2)
plot(X,Y,'.')
set(gcf,'DefaultLineLineWidth',.5)

text(X(1),Y(1)+.5,'0')
text(X(2)-.1,Y(2)+.5,'1')
text(X(3)+.3,Y(3),'2')
text(X(4)-.3,Y(4)+.5,'3')
hold on
% between 0 and 1;  0 and 2;  0 and 3;
m10 = m1-m0;
d = log(p0/p1)*(m10)/norm(m10)^2;
xt10 = .5*(m0+m1)+d;

m20 = m2-m0;
d = log(p0/p2)*(m20)/norm(m20)^2;
xt20 = .5*(m0+m2)+d;

m30 = m3-m0;
d = log(p0/p3)*(m30)/norm(m30)^2;
xt30 = .5*(m0+m3)+d;

% between 1 and 2; between 1 and 3
m21 = m2-m1;
d = log(p1/p2)*(m21)/norm(m21)^2;
xt21 = .5*(m1+m2)+d;

m31 = m3-m1;
d = log(p1/p3)*(m31)/norm(m31)^2;
xt31 = .5*(m1+m3)+d;

% between 2 and 3

m32 = m3-m2;
d = log(p2/p3)*(m32)/norm(m32)^2;
xt32 = .5*(m2+m3)+d;

x1223 = interplane(m21,xt21,m32,xt32);
x1323 = interplane(m31,xt31,m32,xt32);
x1303 = interplane(m31,xt31,m30,xt30);
x2303 = interplane(m32,xt32,m30,xt30);

set(gcf,'DefaultLineLineWidth',1);
[x,y] = plotplane(m21,xt21,-3,x1223(1));
plot(x,y)

[x,y] = plotplane(m31,xt31,x1303(1),x1323(1));
plot(x,y);

[x,y] = plotplane(m30,xt30,x1303(1),x2303(1))
plot(x,y);

[x,y] = plotplane(m32,xt32,x1223(1),x2303(1));
plot(x,y);
 
[x,y] = plotplane(m10,xt10,-4,x1303(1))
plot(x,y);

[x,y] = plotplane(m20,xt20,x2303(1),10)
plot(x,y);

set(gcf,'DefaultLineLineWidth',.5);

plot([X(1) X(2)],[Y(1),Y(2)],'--')
plot([X(1) X(3)],[Y(1),Y(3)],'--')
plot([X(1) X(4)],[Y(1),Y(4)],'--')
plot([X(2) X(3)],[Y(2),Y(3)],'--')
plot([X(2) X(4)],[Y(2),Y(4)],'--')
plot([X(3) X(4)],[Y(3),Y(4)],'--')

set(gcf,'DefaultLineLineWidth',.5);
[x,y] = plotplane(m21,xt21,x1223(1),1);
plot(x,y)
[x,y] = plotplane(m31,xt31,x1323(1),1);
plot(x,y);
[x,y] = plotplane(m31,xt31,-3,x1303(1));
plot(x,y);
[x,y] = plotplane(m30,xt30,-4,x1303(1))
plot(x,y);
[x,y] = plotplane(m30,xt30,x2303(1),9)
plot(x,y);
[x,y] = plotplane(m32,xt32,-2,x1223(1))
plot(x,y);
[x,y] = plotplane(m32,xt32,x2303(1),10);
plot(x,y);
[x,y] = plotplane(m10,xt10,x1303(1),0)
plot(x,y);
[x,y] = plotplane(m20,xt20,4,x2303(1))
plot(x,y);

axis equal
%grid on
set(gca,'XTick',[-4,-2,0,2,4,6,8 10]);
axis([-4 10 -8 6])
set(gcf,'Position',[550,350,250,250]);
set(gcf,'PaperPositionMode','auto');  % make printer print same size as screen
set(gca,'Box','off')
set(gca,'Visible','off')
print -dps ../pictures/bayesbound1.ps
print -deps ../pictures/bayesbound1.eps
%print -dps ../pictures/bayesbound2.ps
%print -deps ../pictures/bayesbound2.eps