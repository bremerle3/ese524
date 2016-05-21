% testet.m
% Test the emission tomography code
% This script loads an image file, plots it, then calls the 
% code to test the tomographic reconstruction

% Copyright 1999 by Todd K. Moon

% Load and plot the original image
load ../data/im1;             % an image scaled so 255=white (variable=im)
[nr,nc] = size(im);
subplot(2,2,1);   imagesc(uint8(im));  colormap(gray);  axis image; 
set(gca,'XTick',[]);   set(gca,'YTick',[]);  drawnow;

im = 255*ones(nr,nc)-im;      % scale so 0=white

% Call the ET stuff
et1

% Scale the result for plotting
lambdac = 255*ones(nr,nc) - 255*lambda/max(max(lambda));
subplot(2,2,2);   imagesc(lambdac);  axis image;
set(gca,'XTick',[]);  set(gca,'YTick',[]);

