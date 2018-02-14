phi_1 = inline('sqrt(z - 0.36 -0.1i)');
x0 = -1.6;

test = [];
test = Inv_Iter(phi_1,x0);