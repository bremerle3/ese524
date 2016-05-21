function fnew = hmmupfv(y,statelist,n,f)
% 
% Compute an update to the distribution f based upon the data y
% and the (assumed) state assignment in statelist
%
% function fnew = hmmupfv(y,statelist,n,f)
%
% y = sequence of observations
% statelist = state assignments
% n = number of states
% f = distribution (cell) to update
%
% fnew = updated distribution

% Copyright 1999 by Todd K. Moon

fnew = f; 
for state=1:n
  ystate = y(statelist==state);     % gather all the data together from a state
  % now update according to the type of the distribution
  if(f{1}==1)             % discrete distribution
  [nout,nt] = size(f{2});
  nt = length(ystate);       % total number of outputs from this state
  for j=1:nout
    nj = sum(ystate==j);
    if(nt) fnew{2}(j,state) = nj/nt; end;
  end
  elseif(f{2}==2)                   % Gaussian distribution
  [d,Ts] = size(ystate);
  if(Ts)  % if any outputs from this state
    f{2,state} = mean(ystate')';
    f{3,state} = cov(ystate');
  end
  end
end