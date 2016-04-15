function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%


%%implement k-fold
%%% Parameters setting
% bestC=0;
% bestP=0;
% bestval=10^10;


[d n]=size(xTr);
% Cs=2.^[-5:5];
% paras=2.^[-5:5];
Cs_length = length(Cs);
paras_length = length(paras);
err=[];
allvalerrs=[];

k=7;

%% Split off validation data set
% YOUR CODE

    % X=mat2cell(xTr,d,n/k*ones(1,k));
    % Y=mat2cell(yTr,1,n/k*ones(1,k));
%% Evaluate all parameter settings
% YOUR CODE
  for ii=1:Cs_length
	for jj=1:paras_length
        for j=1:k
            start=1+floor((j-1)*n/k);
            xVal=xTr(:,start:start+floor(n/k)-1);
            yVal=yTr(1,start:start+floor(n/k)-1);
            xTrain=xTr;
            yTrain=yTr;
            xTrain(:,start:start+floor(n/k)-1)=[];
            yTrain(:,start:start+floor(n/k)-1)=[];
            svmclassify=trainsvm(xTrain,yTrain,Cs(ii), ktype, paras(jj));
            err(j)=sum(sign(svmclassify(xVal))~=yVal(:))/length(yVal);
        end
		allvalerrs(ii,jj)=mean(err);
    end
  end
  
    
%% Identify best setting
% YOUR CODE
    bestval =min(min(allvalerrs));
    [BestC,BestP] = find(allvalerrs==bestval);
    bestC=Cs(BestC(1+floor(length(BestC)*rand)));
    bestP=Cs(BestP(1+floor(length(BestP)*rand)));

end


