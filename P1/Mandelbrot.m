function [orbit,diverged] = Mandelbrot(phi, c)
diverged = false;
pt = 0;
x0 = 0;
x1 = 0 + 1;
orbit = [];
while abs(x1 - pt) > 10^-8
    x1 = phi(x0,c);
    if abs(x1) > 100
        %disp("Diverged");
        diverged = true;
        break;
    end
    if length(orbit) > 20
        %disp("Converged");
        diverged = false;
        break;
    end;
    orbit = [orbit, x1];
    x0 = x1;
    
end

  

    