function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here




T=T;
leaf=find(T(4,:)==0&T(6,:)~=0);%not empty
evenIdx   = find(mod(leaf,2) == 0);
leaf = leaf(evenIdx);%left leaf
leafparent=T(6,leaf);

newT=T;
err=analyze('acc',y,evaltree(T,xTe));
for i=1:length(leaf)
if newT(6,leaf(i))~=0 
    newT(:,leaf(i))=0;
    newT(:,leaf(i)+1)=0;

    newT(4,leafparent(i))=0;
    newT(5,leafparent(i))=0;
    newerr=analyze('acc',y,evaltree(newT,xTe));
    if newerr>=err
         T=newT;
         err=newerr;
    end
end
end



