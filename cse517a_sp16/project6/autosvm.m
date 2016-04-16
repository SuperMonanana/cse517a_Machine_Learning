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

kernel='rbf';
[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,kernel,2.^[-1:5],2.^[-2:2]);

%[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',bestC,bestP);
[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',bestC-3:1:bestC+3,bestP-2:0.5:bestP+2);


disp('Training SVM ...');
svmclassify=trainsvm(xTr,yTr, bestC,kernel,bestP);

