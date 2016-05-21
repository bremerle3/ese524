function f = hmmdiscfup(y,alpha,beta,HMM)
% 
% Update the output probability distribution f of the HMM using the forward
% and backward probabilities alpha and beta
%
% function f = hmmdiscfup(y,alpha,beta,HMM)
%
% y = input sequence
% alpha = forward probabilities
% beta = backward probabilities
% HMM = current model parameters
%
% f = updated distribution

% Copyright 1999 by Todd K. Moon

[S,S] = size(HMM.A);      [N,S] = size(HMM.f{2});
f = HMM.f;
for s=1:S
  d = alpha(s,:) * beta(s,:)';
  for i = 1:N
    idx = find(y==i);
    f{2}(i,s) = sum(alpha(s,idx) .* beta(s,idx))/d;
  end
end