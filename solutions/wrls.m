function [h,eap] = wrls(x,d)
% 
% Given a scalar input signal x and a desired scalar signal d,
% compute an RLS update of the weight vector h.
% eap is an optional return parameter, the a-priori estimation error
% This function must be initialized by wrlsinit
%
% function [h,eap] = wrls(x,d)
%
% x = scalar input
% d = desired value
%
% h = filter coefficient vector
% eap = a priori estimation error

% Copyright 1999 by Todd K. Moon

global hrls;  global Prls; global xrls; 
global lambda

xrls = [conj(x);xrls(1:length(xrls)-1)];
k = Prls*xrls/(1+xrls'*Prls*xrls/lambda)/lambda;
eap = d - xrls'*hrls;  % a priori error
hrls = hrls + k*eap;
Prls = Prls - k*xrls'*Prls;
h = hrls;