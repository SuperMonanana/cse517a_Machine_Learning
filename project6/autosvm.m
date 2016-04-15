function svmclassify=autosvm(xTr,yTr)
%	function svmclassify=autosvm(xTr,yTr)
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% 
% Output:
% svmclassify : a classifier (scmclassify(xTe) returns the predictions on xTe)
%
%
% Performs cross validation to train an SVM with optimal hyper-parameters on xTr,yTr
%
disp('Performing cross validation ...');

ktype='rbf'
%[bestC,bestP]=crossvalidate(xTr,yTr,ktype,2.^[-1:8],4);


disp('Training SVM ...');
svmclassify=trainsvm(xTr,yTr,256,ktype,4);

