function yOut = leftSlitInt(B,theta)

% B = [x0,D,I0]

th0 = B(1); %x(y==Io)
D = B(2);
I0 = B(3); %Io=max(y)


%L = 0.498;  % WARNING L in mm must have same dimensions as xc
%theta = (xc-th0)/L;  %in radians
lambda = 546e-9;%in m
a= (pi/lambda)*D*sin(theta-th0);

term1= (sin(a)./a).^2; 
term1(isnan(term1)) = 1;


yOut= I0 * (term1); 


end