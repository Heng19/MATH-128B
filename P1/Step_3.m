phi_1 = inline('sqrt(z + 1)');
x0 = 0;
test = Inv_Iter(phi_1,x0);
plot(test,'.')