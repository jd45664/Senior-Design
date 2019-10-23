s = 2+2i;
epsilon = 1 + 1i;
w = 50;
[c,g] = calculate_const(s,w,epsilon);
disp(c);
disp(g);
new_s = 5+5i;
perm = calculate_epsilon(c,g,w,new_s);
disp(perm);
equation = perm(1);
disp(equation(1));
%test = solve([equation(1)],[equation(2)]);
%disp(perm);
function[c,g] = calculate_const(s,w,epsilon)
constant = 0.02*(1-s)/(1+s);
%real(constant) = -imaginary(epsilon)*w*C + real(epsilon ** 5/2)*G
%imaginary(constant) = real(epsilon)*w*C + imaginary(epsilon ** 5/2) * G
syms C G
tmp1 = real(1i*w*epsilon);
tmp2 = imag(1i*w*epsilon);
%eqn1 = (-1)*imag(epsilon)*w*C + real(epsilon^5/2)*G == real(constant);
%eqn2 = real(epsilon)*w*C + imag(epsilon^5/2)*G == imag(constant);
eqn1 = tmp1*C + real(epsilon^(5/2))*G == real(constant);
eqn2 = tmp2*C + imag(epsilon^(5/2))*G == imag(constant);
sol = solve([eqn1,eqn2],[C,G]);
c = sol.C;
g = sol.G;
disp(double(c));
disp(double(g));
end
function[m_epsilon] = calculate_epsilon(c,g,w,s)
Y = 0.02*(1-s)/(1+s);
syms e
eqn = 1i*w*c*e + (e^(5/2))*g == Y;
m_epsilon = solve(eqn);
end