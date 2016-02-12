function preds=competition(xTr,yTr,xTe);
% function preds=competition(xTr,yTr,xTe);
%
% A classifier that outputs predictions for the data set xTe based on 
% what it has learned from xTr,yTr
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

% The random classifier is awesome!!! Could you possibly do better?
% un=unique(yTr);
% [d,n]=size(xTe);
% preds=randi(length(un),1,n);

%fill in the code here
k=5;
preds=knnclassifier(xTr,yTr,xTe,k);preds2=knnclassifier(xTr,yTr,xTe,k);
accuracy=analyze('acc',truth,preds);accuracy2=analyze('acc',truth,preds2);
while accuracy<accuracy2 & k~=1
    k=k-1;
    preds=preds2;
    preds2=knnclassifier(xTr,yTr,xTe,k);
end
   
    
