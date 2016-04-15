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
[bestC,bestP]=crossvalidate(xTr,yTr,ktype,2.^[-2:8],2.^[-2:5]);
[bestC,bestP]=crossvalidate(xTr,yTr,ktype,[bestC/2:(bestC*2-bestC/2)/3:bestC*2],2.^[bestP/2:(bestP*2-bestP/2)/3:bestP*2]);

disp('Training SVM ...');
svmclassify=trainsvm(xTr,yTr,bestC,ktype,bestP);

