%plot(doubleslitdata,'ro');

x = doubleslitdata(:,1);
V = doubleslitdata(:,2);
sigV = 0.0005*ones(size(V));
errorbar(x,V,sigV,'r-')
 
hold on
Afit= lsqcurvefit(@twoSlitInt,A0, x,Counts);
yFit=twoSlitInt(Afit,x);
errorbar(x,Counts,sigV,'bo')
hold on
plot(x,yFit,'r-')