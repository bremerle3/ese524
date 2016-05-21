% ERFCDEMO
% Q for N[0,1]
% R. Martin Arthur
% 19 February 2008

% Find Gaussian density
y=[-5:0.1:5]; f=(1/sqrt(2*pi))*exp(-y.^2/2);
% Find Q(x)
x=[-6:0.1:6]; q=0.5*erfc(x./sqrt(2));

% Plot Gaussian density and Q(x)
figure; clf;
subplot(211); plot(y,f,'LineWidth',2); grid on;
ahan=gca; set(ahan,'FontSize',18);
xlabel('x'); ylabel('f(x)'); title('(1/[2\pi]^{0.5}exp(-x^2/2)')
subplot(212); semilogy(x,q,'LineWidth',2); grid on;
ahan=gca; set(ahan,'FontSize',18);
xlabel('x'); ylabel('Q(x)'); title('from x to \infty using erfc')
