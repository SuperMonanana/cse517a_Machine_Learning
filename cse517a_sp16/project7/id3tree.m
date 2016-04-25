function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here
[d,n] = size(xTr);
if nargin < 3
  maxdepth = Inf;
  weights = ones(1,n);
  q=7;
else
  q = 2^maxdepth - 1; 
end;
if nargin < 4
  weights = ones(1,n);
end;
T = zeros(6, q);


%use recursion to make the complexity O(nlogn)

T = buildTree(T, 0, 1, xTr, yTr,weights,maxdepth);
end

function T = buildTree(T, root, node,xTr, yTr, weights, maxdepth)
[feature,cut,Hbest]=entropysplit(xTr,yTr,weights);


T(1, node) = mode(yTr);
T(2, node) = feature;
T(3, node) = cut;

%if leaf
if maxdepth==1||size(xTr,2)<2||feature==0||any(yTr~=yTr(1))==0
    T(4, node) = 0;
	T(5, node) = 0;
else
    left = node*2;
	T(4, node) = left;
	leftIdx = find(xTr(feature, :) <= cut);
	T = buildTree(T, node, left, xTr(:, leftIdx), yTr(1, leftIdx), weights, maxdepth-1);
	right = node*2 + 1;
	T(5, node) = right;
	rightIdx = find(xTr(feature, :) > cut);
	T = buildTree(T, node, right,xTr(:, rightIdx),yTr(1, rightIdx), weights, maxdepth-1);
end

T(6, node) = root;
end
    







