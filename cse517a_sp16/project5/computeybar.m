function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);
%this is not correct!sigma is a identity matrix!

%set parameters
%sigma=eye(2);
sigma=ones(2,n)
mu1=zeros(2,n);
mu2=OFFSET*ones(2,n);

%compute p(x|y)
pxy1 = prod(normpdf(xTe,mu1,sigma));%MU AND SIGMA HAS TO BE SCALAR? STRANGE!
pxy2 = prod(normpdf(xTe,mu2,sigma));


%use Bayes rule
py1x=pxy1.*0.5./(pxy1.*0.5 + pxy2.*0.5);
py2x=pxy2.*0.5./(pxy1.*0.5 + pxy2.*0.5);


ybar = py1x+py2x*2;


