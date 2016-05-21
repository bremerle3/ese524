function tableau = simppivot(intableau,p,q)
% 
% Pivot a linear programming tableau about the p,q entry
% 
% function tableau = simppivot(intableau,p,q)
%
% intableau = tableau
% (p,q) = point about which to pivot
%
% tableau = pivoted tableau

% Copyright 1999 by Todd K. Moon

[m,n] = size(intableau);
tableau = intableau;
tableau(p,:) = tableau(p,:) / tableau(p,q);
for i=1:m
  if(i ~= p)
    tableau(i,:) = tableau(i,:) - tableau(p,:) .* tableau(i,q);
  end
end