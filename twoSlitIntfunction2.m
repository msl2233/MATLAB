function yOut = twoSlitInt2(A,x)

% A = [x0, d, D, I0]

x0 = A(1);
d = A(2);
D = A(3);
I0 = A(4);


L = 0.498;  % WARNING L must have same dimensions as x
theta = (x-x0)/L;  %in radians
lambda = 541e-9;
k = 2 * pi / lambda;

Phi = k*D*sin(theta);
term1 = (sin(Phi/2)./(Phi/2)).^2;

phi = k*d*sin(theta);
term2 = (cos(phi/2)).^2;

yOut= I0 * term1 .* term2;


end