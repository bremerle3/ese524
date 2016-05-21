% make a surface plot
% Copyright 1999 by Todd K. Moon

clf
l1 = 4; l2 = .4; l3 = 1;
[xs,ys,zs] = mysphere(36,l1,l2,l3);
%subplot(2,2,1);
mesh(xs,ys,zs);
%surf(xs,ys,zs);
% axis vis3d;
axs = 2;
axis([-axs axs -axs axs -axs axs])
%axis vis3d off
%h = findobj('Type','surface');
%set(h,'Facelighting','phong','FaceColor','interp','BackFaceLighting','lit')
material shiny
light('Position',[-3 -1 3])
set(gca,'XTickLabel',[])
set(gca,'YTickLabel',[])
set(gca,'ZTickLabel',[])
print -dps ../pictures/ellipsoid1.ps
print -deps ../pictures/ellipsoid1.eps

clf

%subplot(2,2,1);
mesh(xs,ys,zs);
%surf(xs,ys,zs);
% axis vis3d;
axs = 2;
axis([-axs axs -axs axs -axs axs])
%axis vis3d off
%h = findobj('Type','surface');
%set(h,'Facelighting','phong','FaceColor','interp','BackFaceLighting','lit')
material shiny
light('Position',[-3 -1 3])

%$$$ xlabel('x')
%$$$ vert = [-2 2 -.5
%$$$ 	    -2 -2 -.5
%$$$ 		2 -2 .5
%$$$ 		2 2 .5];
%$$$ vert = [-2 2 0
%$$$ 	    -2 -2 0
%$$$ 		2 -2 0
%$$$ 		2 2 0];
%$$$ face = [1 2 3 4];
%$$$ hold on
%$$$ patch('faces',face,'vertices',vert,'FaceColor','y');

vert2 = [0 -2 -2
	     0 2 -2
		 0 2 2
		 0 -2 2];
face = [1 2 3 4];
patch('faces',face,'vertices',vert2,'FaceColor','y');
set(gca,'XTickLabel',[])
set(gca,'YTickLabel',[])
set(gca,'ZTickLabel',[])
print -dps ../pictures/ellipsoid2.ps
print -deps ../pictures/ellipsoid2.eps





