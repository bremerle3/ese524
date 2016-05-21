function [w,err] = nntrain(x,d,nlayer, m,mu,alpha,maxiter,w)
%
% Train a neural network using the input/output training data [x,d]
%
% function w = nntrain(x,d,m,ninput,mu)
%
% x = [x(1) x(2) ... x(N)] = input training data   
% d = [d(1) d(2) ... d(N)] = output training data
% nlayer = number of layers
% m = number of neurons on each layer, 
%     m(1) = input layer, ... m(nlayer+1) = ouput layer
% mu = steepest descent step size
% alpha = (optional) momentum constant
% maxiter = (optional) maximum number of iterations (w = no maximum)
% w = (optional) starting weights
%
% w = new weights
% err = (optional) total squared error from training

% Copyright 1999 by Todd K. Moon

[ninput,N] = size(x);  [noutput,N1] = size(d);  L = length(m)-1;
if(ninput ~= m(1) | noutput ~= m(nlayer+1) | L ~= nlayer)
  error('training data not compatible with layer specification')
end
if(nargin < 6) alpha = 0; end;
if(nargin < 7) maxiter = 0; end;
% randomly select initial weights, allocate space for the local gradients
if(nargin < 8) w = nnrandw(m); end;
deltaw = w;       % assign space to store last weight update
wmin = w;
if(nargout>1) err = []; end;
lasttotale = 0;  mintotale = 1.e10;  niter = 0;
while(1)          % repeat until convergence
  totale = 0;   niter = niter+1;
  nninitsel(N);        % initialize the selection process
  for n=1:N       % for each input  (loop over a training epoch)
    [xn,dn] = nnselect(x,d);  % select  an input
    [y,V,Y] = nn1(xn,w);   % find the outputs at each layer
    % note: Y{l+1} is the output of layer l; Y{1} is input
    e = dn - y;                         % output error
    totale = totale + norm(e);
    for l=L:-1:1  % update for each layer, starting at output layer
      if(l == L)                        % output layer
        delta{l} = -e .* phip(V{l},Y{l+1});
      else                              % hidden layers
        delta{l} = phip(V{l},Y{l+1}) .* ((delta{l+1})' * w{l+1}(:,2:end))';
      end
      deltaw{l} = alpha * deltaw{l} - mu*delta{l} * (Y{l})';
      w{l} = w{l} + deltaw{l};
    end %end for l
  end % end for n
  totale = totale/N;
  if(nargout>1) err = [err; totale]; end
  if(totale < mintotale) wmin = w; mintotale = totale; end;
%  else w = wmin; end;
  if(totale==0) break; end
  if(abs(totale - lasttotale)/totale < 1e-6) break; end
  if(maxiter & niter > maxiter) break; end
  lasttotale = totale;
end  % end while(1)

%---------------------------------------------------------------------
function phipout = phip(v,y)
% 
% Compute the derivative of phi at the point v
%
% function phipout = phip(v,y)

% Assume the use of the sigmoidal nonlinearity
  phipout = y(2:end) .* (1-y(2:end));

%---------------------------------------------------------------------
function [xn,dn] = nnselect(x,d)
% 
% Select a point at random from the training data, without replacement
% (this ensures that all training data are used in each epoch)
%
% function [xn,dn] = nnselect(x,d)

global nnselar;

i = floor(rand* length(nnselar) + 1);
xn = x(:,i);  dn = d(:,i);
nnselar = [nnselar(1:i-1) nnselar(i+1:end)];

%--------------------------------------------------------------------
function nninitsel(N)
% 
% Initialize the random selection process
%
% function nninitsel(N)
global nnselar;

nnselar = 1:N;