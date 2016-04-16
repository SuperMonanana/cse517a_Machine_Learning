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


[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',2.^[-1:5],2.^[0:2]);
[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',2.^[bestC-3:0.5:bestC-2],2.^[bestP-1:0.25:bestP+1]);



disp('Training SVM ...');
svmclassify=trainsvm(xTr,yTr, 2^bestC,'rbf',2^bestP);

