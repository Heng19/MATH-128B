col=hsv(25);
phi_1 = inline('z - (z^3-1)/(3*z^2) ');
hold on
xlim([-2 2])
ylim([-2 2])
for i = 1:50
    for j = 1:50
        x0 = complex(-1 + 0.04*i, -2 + 0.08*j);
        [orbit,divergence] = Julia_diverge(phi_1, x0);
        
        if divergence == false
            
            speed = length(orbit);
            plot(orbit, '.','MarkerSize',10, 'Color', col(speed,:));
        
        end;
        
        
    end;
end;