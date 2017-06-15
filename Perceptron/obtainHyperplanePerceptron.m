function w=obtainHyperplanePerceptron(X,w)

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

figure(1);
plot(xplus,yplus,'bo',xminus,yminus,'r*',[minX,maxX],[-w(1)*minX/w(2)-w(3)/w(2),-w(1)*maxX/w(2)-w(3)/w(2)],'k-');

flag = 0;
iteration =0;
while flag~=1 && iteration<=1000
    flag = 1;
    iteration  = iteration+1;
    for i=1:M
        p = X(i,:)*w';
        if p<=0
            w = w+X(i,:);
            w
            flag = 0;
            plot(xplus,yplus,'bo',xminus,yminus,'r*',[minX,maxX],[-w(1)*minX/w(2)-w(3)/w(2),-w(1)*maxX/w(2)-w(3)/w(2)],'k-');
        end;
    end;
end;