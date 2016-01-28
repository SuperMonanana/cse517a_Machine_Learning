function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
    n=size(X,2);
    S1=X'*X;
    S2=diag(S1);
    S=repmat(S2,1,n);
    G=innerproduct(X);
    D=sqrt(S+S'-2*G);
    

else  % case when there are two inputs (X,Z)
	n=size(X,2);
    m=size(Z,2);
    S1=X'*X;
    S2=diag(S1);
    S=repmat(S2,1,m);
    R1=Z'*Z;
    R2=diag(R1);
    R3=R2';
    R=repmat(R3,n,1);
    G=innerproduct(X,Z);
    D=sqrt(S+R-2*G);
end;
%



