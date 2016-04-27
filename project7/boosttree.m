function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here

if nargin<4,
    maxdepth = 3;
end;
if nargin<3,
    nt = 100;
end;

n = size(x, 2);
weights = ones(1, n)./ n;

BDT=cell(2,nt);
%BDT = zeros(6 * nt + 1, 2^maxdepth - 1);
for i = 1:nt
    T = id3tree(x,y,maxdepth,weights);
    
    h = evaltree(T,x);
    err = sum(weights ((y ~= h)));
    if err>0.5
        break
    end
     alpha= 0.5.*log((1 -err) / err);
     
%     BDT=BDT+alpha.*T;
%     z=1-2*abs(h-y);
%     weights = ones(1,n)/n;
%     weights = (weights.*(exp(-alpha *z))) ./ (2*sqrt(err*(1-err)));
    weights = weights .* exp(- alpha .*h.*y )./(2*sqrt(err*(1-err)));
     weights = weights ./ sum(weights);
    
    BDT{1,i}=T;
    BDT{2,i}=alpha;
end



