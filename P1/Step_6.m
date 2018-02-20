col=hsv(30);
phi_1 = inline('z^2  - 1 ');
hold on
xlim([-2 2])
ylim([-2 2])
for i = -50:50
    for j = -50:50
        x0 = complex(0.04*i, 0.04*j);
        [orbit,connected] = Julia_Connect(phi_1, x0);
        
        if connected == false
            speed = length(orbit);
            plot(orbit, '.','MarkerSize',10, 'Color', col(speed,:));
        end;
        
        
    end;
end;