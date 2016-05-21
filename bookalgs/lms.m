function [h,eap] = lms(x,d)
% 
% Given a (real) scalar input signal x and a desired scalar signal d,
% compute an LMS update of the weight vector h.
% This function must be initialized by lmsinit
%
% function [h,eap] = lms(x,d)
%
% x = input signal (scalar)
% d = desired signal (scalar)
%
% h = updated LMS filter coefficient vector
% eap = (optional) a-priori error

% Copyright 1999 by Todd K. Moon

global hlms; global mulms; global xlms;

xlms = [x;xlms(1:length(xlms)-1)];
eap = d - hlms'*xlms;  % a priori error
hlms = hlms + mulms*xlms*eap;
h = hlms;
