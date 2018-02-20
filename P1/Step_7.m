col=hsv(30);
phi_1 = inline('z - (z^3-1)/(3*z^2) ');
hold on
xlim([-2 2])
ylim([-2 2])
for i = -20:20
    for j = -20:20
        x0 = complex(0.1*i, 0.1*j);
        [orbit,connected] = Julia_Connect(phi_1, x0);
        
        %if connected == true
        speed = length(orbit);
        plot(orbit, '.','MarkerSize',10, 'Color', col(speed,:));
        %end;
        
        
    end;
end;