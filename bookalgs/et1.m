% et1.m
% Perform tomographic reconstruction using the EM algorithm
% im is a (nr x nc) image scaled so that 0=white, 255=black
% nr = number of rows;   nc = number of columns

% Copyright 1999 by Todd K. Moon

% Set up the transition probabilities p(d|b)
% The probability is a linear function of the distance from the detector
p = zeros(4,max(nr,nc));
l = 2*(nr+1);
p(1,1:nr) = (nr:-1:1)/l;            % row of top detectors
p(2,1:nr) = (1:nr)/l;               % row of bottom detectors
l = 2*(nc+1);
p(3,1:nc) = (nc:-1:1)/l;            % left side detectors
p(4,1:nc) = (1:nc)/l;               % right side detectors

% Simulate the measurement data
initpoisson                         % initialize the Poisson generator
% find the mean for each detector
y = zeros(4,max(nr,nc));            % set up room for each bank of detectors
for d=1:nc
  lambday = im(:,d)' * p(1, 1:nr)'; % compute the mean of the Poisson
  y(1,d) = poisson(lambday);        % first bank of detectors
  lambday = im(:,d)' * p(2, 1:nr)';
  y(2,d) = poisson(lambday);        % second bank of detectors
end
for d=1:nr
  lambday = im(d,:) * p(3,1:nc)';   % third bank of detectors
  y(3,d) = poisson(lambday);
  lambday = im(d,:) * p(4,1:nc)';   % fourth bank of detectors
  y(4,d) = poisson(lambday);
end

% The data in y contain the observations in each of the four banks:
% y(1,:) = detectors on top      y(2,:) = detectors on bottom
% y(3,:) = detectors on left     y(4,:) = detectors on right
%-------------------------------------------------------------
% Now do the reconstruction (This is where the tomography really happens)

lambda = ones(nr,nc);               % this will be lambda(b)
lambdan = zeros(nr,nc);             % the new lambda
niter = 5;
for i=1:niter
  % the pair (b1,b2) represents the box number b, so
  % this double loop goes from 1:B
  for b1=1:nr
    for b2 = 1:nc
      s = 0;                        % sum value
      % Each box sees four detectors: sum over each detector seen
      s = y(1,b2)*p(1,b1)/(lambda(:,b2)'*p(1,1:nr)');
      s = s + y(2,b2)*p(2,b1)/(lambda(:,b2)'*p(2,1:nr)');
      s = s + y(3,b1)*p(3,b2)/(lambda(b1,:)*p(3,1:nc)');
      s = s + y(4,b1)*p(4,b2)/(lambda(b1,:)*p(4,1:nc)');
      lambdan(b1,b2) = lambda(b1,b2)*s;
    end
  end
  lambda = lambdan;
% Scale the result for plotting

lambdac = 255*ones(nr,nc) - 255*lambda/max(max(lambda));
subplot(2,2,1);   imagesc(lambdac);  axis image;
set(gca,'XTick',[]);  set(gca,'YTick',[]);
drawnow  
end
