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
allvalerrs=zeros(Cs_length,paras_length);
k=10;


%% Split off validation data set
% YOUR CODE
indices=crossvalind('Kfold',length(yTr),k);
%     X=mat2cell(xTr,d,n/k*ones(1,k));
%     Y=mat2cell(yTr,1,n/k*ones(1,k));
%% Evaluate all parameter settings
% YOUR CODE

% xVal=X{k};
% yVal=Y{k};

% xVal=xTr(:,indices==k-1);
% yVal=yTr(:,indices==k-1);
 
for j=1:k 
       xVal=xTr(:,indices~=j);
       yVal=yTr(:,indices~=j);
      xTrain=xTr(:,indices==j);
      yTrain=yTr(:,indices==j);
%     xTrain=X{j};
%     yTrain=Y{j};
    %      start=1+floor((j-1)*n/k);
%             xVal=xTr(:,start:start+floor(n/k)-1);
%             yVal=yTr(1,start:start+floor(n/k)-1);
%             xTrain=xTr;
%             yTrain=yTr;
%             xTrain(:,start:start+floor(n/k)-1)=[];
%             yTrain(:,start:start+floor(n/k)-1)=[];
    
    for ii=1:Cs_length
        for jj=1:paras_length
            %[train,test] = crossvalind('LeaveMOut',length(yTr),1);
            [svmclassify,~,~]=trainsvm(xTrain,yTrain,Cs(ii), ktype, paras(jj));
            err=sum(sign(svmclassify(xVal))~=yVal(:))./length(yVal);
            allvalerrs(ii,jj)=allvalerrs(ii,jj)+err;
        end
     end
end 
    
%% Identify best setting
% YOUR CODE
    bestval =min(allvalerrs(:));
    [BestCii,BestPjj] = find(allvalerrs==bestval);
        %a=length(BestCii);
        %bestC=Cs(BestCii(a));
        %bestP=paras(BestPjj(a));
     bestC=Cs(BestCii(unidrnd(length(BestCii))));
     bestP=paras(BestPjj(unidrnd(length(BestPjj))));

end


