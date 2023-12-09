
p = linspace(0,1,100);
q = linspace(0,1,100);

[P,Q] = meshgrid(p,q);

F = zeros(size(P));
for i = 1:numel(P)
    if P(i) > 0 && Q(i) > 0 && 1-P(i)-Q(i) > 0
        F(i) = (-1*(P(i)*(log(P(i))/log(2)) + Q(i)*(log(Q(i))/log(2)) + (1-P(i)-Q(i))*(log(1-P(i)-Q(i))/log(2))));
    end
end

surf(P,Q,F);

xlabel('p');
ylabel('q');
zlabel('f(p,q)');

title('Shannon Entropy, H(p,q,1-p-q)');




