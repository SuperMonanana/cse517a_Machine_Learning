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
weights = ones(1, n) ./ n;
alpha = zeros(1, nt);
BDT = zeros(1, 2^maxdepth - 1);
for i = 1:nt
    T = id3tree(x,y,maxdepth,weights);
    h = evaltree(T,x);
    err = weights * (y ~= h)';
    alpha(i) = 0.5 * log((1 -err) / err);
    weights = weights .* exp(- alpha(i) * ((y == h) * 2 - 1));
%     weights = weights ./ sum(weights);
    weights=weights./(2*sqrt(err*(1-err)));
    BDT = T;
end

BDT = {BDT, alpha};

