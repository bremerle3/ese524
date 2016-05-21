function plotw(phi,psi,p1,p2,n,ax,XT,l1,l2) 
% help function for plotting wavelets

% normalize the scaling function
dt = phi(2,1) - phi(1,1);
e = phi(:,2)'*phi(:,2)*dt;
phi(:,2) = phi(:,2)/sqrt(e);

% normalize the wavelet function
dt = psi(2,1) - psi(1,1);
e = psi(:,2)'*psi(:,2)*dt;
psi(:,2) = psi(:,2)/sqrt(e);

% plot
subplot(p1,p2,n);
plot(phi(:,1),phi(:,2));
axis(ax);
set(gca,'XTick',XT);
ylabel(l1);

subplot(p1,p2,n+1);
m = min(psi(:,1));
plot(psi(:,1)-m,psi(:,2));
axis(ax);
set(gca,'XTick',XT);
ylabel(l2);

