function [orbit,divergence] = Julia_diverge(phi, x0)
root1 = 1;
root2 = -exp(complex(0,-pi/3));
root3 = -exp(complex(0,pi/3));
divergence = false;
x1 = x0 + 1;
orbit = [x0];
while (abs(x1 - root1) > 10^-8 & abs(x1 - root2) > 10^-8 & abs(x1 - root3) > 10^-8)
    x1 = phi(x0);
    if abs(x1) > 100
        %disp("Diverged");
        divergence = true;
        break;
    end
    
    orbit = [orbit, x1];
    
    x0 = x1;
    
end

  

 