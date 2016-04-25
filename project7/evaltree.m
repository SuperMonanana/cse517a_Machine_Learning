function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here
[d,n] = size(xTe);
[~,q]=size(T);
ypredict = zeros(1,n);

for i=1:n
  k=1;
  while k<=q
    if T(4,k)==0&&T(5,k)==0;%leaf
		break;
    elseif xTe(T(2,k),i) <= T(3,k)
			k=T(4,k);
    else  
			k=T(5,k);
    end
  end
 
ypredict(1,i) = T(1,k);
  
end

  