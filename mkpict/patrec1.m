% generate some simple pattern recognition example data
% Copyright 1999 by Todd K. Moon

nclass = 5;
ndata = 300;
dim = 2;
 
%$$$ means = [];
%$$$ R = [];
%$$$ C = [];
%$$$ for n=1:nclass
%$$$   means = [means rand(dim,1)*100+ones(dim,1)];  % means
%$$$   v1 = [1;floor(rand*5+1)];
%$$$   v2 = [v1(1);-v1(2)];
%$$$   l1 = rand * 10 + 1;
%$$$   l2 = rand * 10 + 1;
%$$$   R1 = v1*v1'*l1 + v2*v2'*l2;
%$$$   C1 = (chol(R1))';
%$$$   C = [C C1];
%$$$   R = [R R1];
%$$$ end
%$$$ 
%$$$ X = [];     % training data
%$$$ for i=1:ndata
%$$$   class = floor(rand*nclass+1);
%$$$   x = C(: ,(class-1)*dim+1:class*dim)*randn(dim,1) + means(:,class);
%$$$   X = [X x];
%$$$ end
%save pattrecdat
load pattrecdat;
 
clf
subplot(2,2,1);
plot(X(1,:),X(2,:),'.')
axis('square');
axis('equal');
xlabel('x_1');
ylabel('x_2');
axis([0 120 0 120]);
set(gca,'XTick',[0 30 60 90 120]); 
set(gca,'YTick',[0 30 60 90 120]); 
% text(60,-21,'(a)','HorizontalAlignment','center');
print -dps ../pictures/patrec1.ps
print -deps ../pictures/patrec1.eps
pause(2);


clf; subplot(2,2,1);
Y = lgb(X,5);
plot(X(1,:),X(2,:),'.')
hold on
plot(Y(1,:),Y(2,:),'x');
%axis('square');
axis('equal');
axis([0 120 0 120]);
xlabel('x_1');
ylabel('x_2');
set(gca,'XTick',[0 30 60 90 120]); 
set(gca,'YTick',[0 30 60 90 120]); 
%text(60,-21,'(b)','HorizontalAlignment','center');

% compute the ellipses
index = zeros(1,ndata);
cumdist = 0;
for i=1:ndata
  mindist = Inf;
  for j=1:nclass
    nm = norm(X(:,i) - Y(:,j));
    if(nm < mindist)
      saveindex = j;
      mindist = nm;
    end
  end
  index(i) = saveindex;
  cumdist = cumdist + mindist;
end
for i=1:nclass
  Xi = X(:,index==i);
  [d1,n1] = size(Xi); 
  Ri = zeros(2,2);
  for j = 1:n1
    v = Xi(:,j) - Y(:,i);
    Ri = Ri + v*v';
  end
  Ri = Ri/n1;
  [u,v] = eig(Ri);
% plot the eigendirections
%  plot([Y(1,i),Y(1,i)+u(1,1)*1.5*sqrt(v(1,1)) ],[Y(2,i),Y(2,i) + u(2,1)*1.5*sqrt(v(1,1))]);
%  plot([Y(1,i),Y(1,i)+u(1,2)*1.5*sqrt(v(2,2))],[Y(2,i),Y(2,i) + u(2,2)*1.5*sqrt(v(2,2))]);
% factor of 1.5 is to make them stand out better on the plot
xp = plotellipse(inv(Ri),Y(:,i),1);
plot(xp(1,:), xp(2,:))
xp = plotellipse(inv(Ri),Y(:,i),2);
plot(xp(1,:), xp(2,:))
end

print -dps ../pictures/patrec2.ps
print -deps ../pictures/patrec2.eps