function bias=recoverBias(K,yTr,alphas,C);
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%


% YOUR CODE 

%if C>alphai>0, solve the equation for b
index=find(alphas>0&alphas<C);
Bias = 1 ./ yTr(index) - (yTr .* (alphas')*K(:,index));
%the Bias above should be a 1*n vector, and all the elements are same;but
%we still calculate the mode of it to extract the bias(just in case they are not the
%same),we use mode because it is better than mean, therefore obviously for
%some reason the elements in Bias are not the same.
bias=mode(Bias);