%max torque measured in nm
TauMaxmeasured=[16.13,18.6,42.65,43.07];
% max torque calculated using textbook formulas
%calc inertia and T for each
t1= 9.120142338*10^-7;
t2= 1.0549158*10^-6;
t3= 5.980948183*10^-6;
t4= 6.465681212*10^-6;

c1= 0.003302;
c2= 0.00334798;
c3= 0.0044704;
c4= 0.004572;

j1= (pi/2)*(c1^4);
j2= (pi/2)*(c2^4);
j3= (pi/2)*(c3^4);
j4= (pi/2)*(c4^4);

T=[t1,t2,t3,t3];
J=[j1,j2,j3,j3];
c=[c1,c3,c3,c4];
TauMaxcalc= ((T.*c)./J)
%disp(TauMaxcalc)
%measured diameters, goal was d1=d2 and d3=d4 
d1= 0.006604;
d2= 0.0069596;
d3= 0.0089408;
d4= 0.009144;

D1=[d1,d2];
D2=[d3,d3];
D=[d1,d2,d3,d4];

%ave
D1ave=mean(D1);
D2ave= mean(D2);

%standard dev
D1s=std(D1)
D2s=std(D2)

%find differences in Taumeasured and Tau calc, ave, and std, and uncertainty 
TauDiff= abs(TauMaxmeasured-TauMaxcalc)
TauAve= (TauMaxmeasured+TauMaxcalc)./2
TauCombined= cat(3,TauMaxcalc,TauMaxmeasured);
TauStd= std(TauCombined,0,3)
TauUnc= TauStd./sqrt(4)
 %peak displacement 
peakD=[2.9302,2.5858,2.5893,3.1263];


% Calculate differences, average, standard deviation, and uncertainty
TauDiff = abs(TauMaxmeasured - TauMaxcalc);
TauAve = (TauMaxmeasured + TauMaxcalc) / 2;
TauCombined = cat(3, TauMaxcalc, TauMaxmeasured);
TauStd = std(TauCombined, 0, 3);
TauUnc = TauStd / sqrt(4);

% Peak displacement values
peakD = [2.9302, 2.5858, 2.5893, 3.1263];

% Calculate differences, average, standard deviation, and uncertainty
TauDiff = abs(TauMaxmeasured - TauMaxcalc);
TauAve = (TauMaxmeasured + TauMaxcalc) / 2;
TauCombined = cat(3, TauMaxcalc, TauMaxmeasured);
TauStd = std(TauCombined, 0, 3);
TauUnc = TauStd / sqrt(4);

% Peak displacement values
peakD = [2.9302, 2.5858, 2.5893, 3.1263];

% Provided diameters
d1 = 0.006604;
d2 = 0.0069596;
d3 = 0.0089408;
d4 = 0.009144;

% Create arrays
D1 = [d1, d2];
D2 = [d3, d3];
D = [d1, d2, d3, d4];

% Calculate differences, average, standard deviation, and uncertainty
TauDiff = abs(TauMaxmeasured - TauMaxcalc);
TauAve = (TauMaxmeasured + TauMaxcalc) / 2;
TauCombined = cat(3, TauMaxcalc, TauMaxmeasured);
TauStd = std(TauCombined, 0, 3);
TauUnc = TauStd / sqrt(4);

% Peak displacement values
peakD = [2.9302, 2.5858, 2.5893, 3.1263];

figure;

plot(D,TauMaxmeasured,'ro')
hold on
plot(D,TauMaxcalc,'b^')
xlabel('Diameter(m)')
ylabel('Max Shear Stress (Nm)')
title('Max Shear Stress as a fucntion of diameter')
hold on
%fit the data
p1=polyfit(D,TauMaxmeasured,1);
fit1=polyval(p1,D);
plot(D,fit1,'r-')
hold on
p2=polyfit(D,TauMaxcalc,1);
fit2=polyval(p2,D);
plot(D,fit2,'b-')
hold on
%plot(D,TauAve,'gd')
errorbar(D,TauAve,TauUnc,'go')
p3=polyfit(D,TauAve,1);
fit3=polyval(p3,D);
plot(D,fit3,'g-')
legend('Location', 'northwest')
legend('TauMaxmeasured','TauMaxCalc','TauMaxmeasured Fit','TauMaxCalc Fit','TauAve with Uncertainty','TauAve Fit')
hold off

figure;
plot(D(1:2),TauAve(1:2),'ro')
title('TauMax Scale With Small Diameters')
xlabel('Diamater (m)')
ylabel('TauMax (Nm)')
hold on
p4=polyfit(D(1:2),TauAve(1:2),1);
fit4=polyval(p4,D(1:2));
plot(D(1:2),fit4,'b-')
slope = p4(1);
disp(['The slope of the fit line is: ' num2str(slope)]);
legend('TauMaxAve at r1 and r2', 'Slope fit line: 14396.0001')
hold off 

figure;
plot(D(3:4),TauAve(3:4),'bo')
title('TauMax Scale With Large Diameters')
xlabel('Diamater (m)')
ylabel('TauMax (Nm)')
hold on
p5=polyfit(D(3:4),TauAve(3:4),1);
fit5=polyval(p5,D(3:4));
plot(D(3:4),fit5,'r-')
slope = p5(1);
disp(['The slope of the fit line is: ' num2str(slope)]);
legend('Location','northwest')
legend('TauMaxAve at r1 and r2', 'Slope fit line:  3416.9068')

% slope increeasing at an increasing rate as diameter increases
% create a torque vs displacement curve for the first test, smallest radius

hold off
peakr1=1:10:350;
Taur1;
plot(peakr1(1:length(Taur1)),Taur1,'m.','MarkerSize',15)
hold on
plot(peakr1(1:length(Taur1)),Taur1,'k-','LineStyle','--')
title('Torque vs Rotational Displacement')
xlabel('Displacement (cm)')
ylabel('Torque (Nm)')


legend('Location','northwest')
legend('Torque Nm')
%%
TauStats=table(TauAve',TauStd',TauUnc','VariableNames',{'TauAve','TauStd','TauUnc'});
% Find t-experiemntal value to check hypothesis
%t-experimental
TauSbar= TauStd./sqrt(4);
x=TauMaxcalc;
xbar= TauAve;
tExp=(TauMaxmeasured-xbar)./TauSbar
if tExp(1:1) < 2.314
  result=(' t experiment < t hyopothesis, can accept null hypothesis at given confidence');
disp(result)
else 
    notvalid=('t experiment > t hyopothesis, can reject null hypothesis at given confidence');
    disp(notvalid)
end
