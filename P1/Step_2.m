% Starting with initial value x = -1.8
x0 = -1.8;
y0 = -1.8;

phi_1 = inline('z^2');
phi_2 = inline('z^2 - 1');
phi_3 = inline('z^2 + 0.36 + 0.1i');
phi_4 = inline('z^2  -0.123 -0.745i');

%example142(phi_1,x0,y0)
%example142(phi_2,x0)
%example142(phi_3,x0,y0)
example142(phi_4,x0,y0)

%For different initial value x = -1.8 - 0.3i

x1 = -1.8 - 0.3i;
%example142(phi_1,x1)