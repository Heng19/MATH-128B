col=hsv(20);
phi_1 = inline('z^2  - 1 ');
hold on
xlim([-2 2])
ylim([-2 2])
for i = -10:10
    for j = -100:100
        x0 = complex(0.02*i, 0.02*j);
        [orbit,connected] = Julia_Connect(phi_1, x0);
        
        if connected == false
            speed = length(orbit)
            plot(orbit, '.','MarkerSize',10, 'Color', col(speed,:));
        end;
        
        
    end;
end;