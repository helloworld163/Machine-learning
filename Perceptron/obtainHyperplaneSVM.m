function w = obtainHyperplaneSVM(X, kernel)
[M,N] = size(X);

xapp = X(:,[1:N-1]);
yapp = X(:,N);

%-----------------------------------------------------
%   Learning and Learning Parameters
c = 0.1;
epsilon = .000001;
kerneloption= 1;
[xsup,alpha,b,pos]=svmclass(xapp,yapp,c,epsilon,kernel,kerneloption);
[M,N] = size(xsup);
w= alpha'*xsup;
w = [w,b];

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
plot(xplus,yplus,'bo',xminus,yminus,'r*',[minX,maxX],[-w(1)*minX/w(2)-w(3)/w(2),-w(1)*maxX/w(2)-w(3)/w(2)],'k-');