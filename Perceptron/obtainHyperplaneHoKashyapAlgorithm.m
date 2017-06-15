function [w,whetherSeparable] = obtainHyperplaneHoKashyapAlgorithm(X,w,b)
[M,N] = size(X);
xplus = [];
yplus = [];
xminus = [];
yminus = [];
for i=1:M
    if X(i,3)==1
        xplus = [xplus, X(i,1)];
        yplus = [yplus, X(i,2)];
    else
        xminus = [xminus, X(i,1)];
        yminus = [yminus, X(i,2)];
    end;
end;

minX =inf;
maxX = -inf;
for i=1:M
    if minX>X(i,1)
        minX = X(i,1);
    end;
    if maxX<X(i,1)
        maxX = X(i,1);
    end;
end;


for i=1:M
    if X(i,3) ==-1;
        X(i,1) = -X(i,1);
        X(i,2) = -X(i,2);
    end;
end;

flag = 0;
iteration =0;
delta = 1;
psaduInverseX = inv(X'*X)*X';
e = ones(M,1);
flag =1;
while flag==1
    iteration  = iteration+1;
    e = X*w-b;
    b = b+0.5*delta*(e+abs(e));
    w=psaduInverseX*b;
    plot(xplus,yplus,'bo',xminus,yminus,'r*',[minX,maxX],[-w(1)*minX/w(2)-w(3)/w(2),-w(1)*maxX/w(2)-w(3)/w(2)],'k-');
    if max(e)<=0
        flag = 0;
    elseif max(abs(e))<0.001
        flag = 0;
    end;
end;
 

% whetherSeparable = 0 说明 点集 X 不线性可分
% wheterSeparable = 1 说明  点集 X 线性可分
if max(e)<=0
    whetherSeparable = 0;
elseif max(abs(e))<0.001 
   whetherSeparable = 1;
end;


