function [h,eap] = rls(x,d)
%
% Given a scalar input signal x and a desired scalar signal d,
% compute an RLS update of the weight vector h.
%
% This function must be initialized by rlsinit
%
% function [h,eap] = rls(x,d)
%
% x = input signal
% d = desired signal
%
% h = updated filter weight vector
% eap = (optional) a-priori estimation error

% Copyright 1999 by Todd K. Moon

global hrls;  global Prls; global xrls; 

xrls = [conj(x);xrls(1:length(xrls)-1)];
k = Prls*xrls/(1+xrls'*Prls*xrls);  % gain vector; remember '=conj.transpose
eap = d - xrls'*hrls;  % a priori error
hrls = hrls + k*eap;
Prls = Prls - k*xrls'*Prls;
h = hrls;