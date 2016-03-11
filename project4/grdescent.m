function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;

i=0;
w=w0;
[loss,gradient]=func(w);

while norm(gradient)>=tolerance && i<=maxiter 
	w=w-stepsize*gradient; 
	lossPrev=loss;
	[loss, gradient]=func(w);
	i=i+1;
	if loss>lossPrev
		stepsize=0.5*stepsize;
		i=i-1;
    else
		stepsize=1.01*stepsize;
	end

end

    
    

