col=hsv(30);
phi_1 = inline('x^2 + y');
hold on
xlim([-2.5 1.5])
ylim([-2 2])
for i = -250:150
    for j = -200:200
        c = complex(0.01*i, 0.01*j);
        [orbit,diverged] = Mandelbrot(phi_1, c);
        
        if diverged == true
            speed = length(orbit);
            plot(c, '.','MarkerSize',10, 'Color', col(speed,:));
        end;
        
        
    end;
end;