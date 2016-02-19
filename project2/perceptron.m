function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);

%% fill in code here
for j=1:100
    index=randperm(n);
    m=0;
    for i=1:n      
        if y(index(i))*w'*x(:,index(i))<=0
            w = perceptronUpdate(x(:,index(i)),y(index(i)),w);
            m=m+1;
        end        
    end
    if m==0
        break
    end
end


