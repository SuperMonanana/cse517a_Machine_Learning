function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here
[d, n] = size(xTe);
nt = length(F);
Pred = zeros(nt, n);
for ii = 1:nt,
	T = cell2mat(F(ii));
	Pred(ii, :) = evaltree(T, xTe);
end

preds = mode(Pred);
