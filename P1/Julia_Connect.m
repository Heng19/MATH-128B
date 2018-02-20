function [orbit,connected] = Julia_Connect(phi, x0)
connected = true;
pt = x0;
x1 = x0 + 1;
orbit = [x0];
while abs(x1 - pt) > 10^-8
    x1 = phi(x0);
    if abs(x1) > 100
        %disp("Diverged");
        connected = false;
        break;
    end
    if length(orbit) > 20
        %disp("Diverged");
        break;
    end;
    orbit = [orbit, x1];
    x0 = x1;
    
end

  

    