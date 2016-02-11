function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
[d,n]=size(xTe);
[d,ntr]=size(xTr);
if k>ntr,k=ntr;end;

%currently assigning random predictions
% un=unique(yTr);
% preds=un(ceil(rand(1,n)*length(un)));

%make predictions

 [indices, dists]=findknn(xTr,xTe,k);
%  indicesModeNotDefined=find(nrows~=1);
if size(indices,2)==1&size(indices,1)~=1
 [M,F,C]=mode(yTr(indices)',1);
else
 [M,F,C]=mode(yTr(indices),1);  
end
 [nrows, ncols] = cellfun(@size, C);
 
 if ncols~=1
     while isempty(find(nrows~=1, 1))&&k~=1
     k=k-1;
     subindex=find(nrows~=1);
     subyTr=yTr(subindex);
     A=indices(subindex)
     subindices=A(1:k,:);
     [subM,F,C]=mode(subyTr(subindices),1);
     M(subindex)=subM;
     [nrows, ncols] = cellfun(@size, C);
     end
 else
     while nrows~=1&k~=1
     k=k-1;
     subindices=indices(1:k,:);
    
     if k>1
        [M,F,C]=mode(yTr(subindices)',1);
     else
        [M,F,C]=mode(yTr(subindices),1);  
     end
     [nrows, ncols] = cellfun(@size, C);
     end
 end

% if ncols==1
% while nrows~=1&k~=1
%      k=k-1;
%      subindices=indices(1:k,:);
%     
%      if k>1
%         [M,F,C]=mode(yTr(subindices)',1);
%      else
%         [M,F,C]=mode(yTr(subindices),1);  
%      end
%      [nrows, ncols] = cellfun(@size, C);
%      end
% else
%  while length(find(nrows==1))==length(nrows)&k~=1%When nrows~=1, Mode not defined
%      k=k-1;
%      [indices, dists]=findknn(xTr,xTe,k);
%      if size(indices,2)==1&size(indices,1)~=1
%         [M,F,C]=mode(yTr(indices)',1);
%      else
%         [M,F,C]=mode(yTr(indices),1);  
%      end
%      [nrows, ncols] = cellfun(@size, C);
%  end
% end
 
 preds=M;
     
     


