function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here
n=size(xTe,2);
nt=size(BDT,2);
preds=zeros(1,n);a=0;hi=zeros(1,n);
for i=1:nt
    hi=evaltree(BDT{1,i},xTe);
    alpha=BDT{2,i};
    preds=preds+hi.*alpha;
    
     a=a+alpha;
end
preds = round(preds / a );


