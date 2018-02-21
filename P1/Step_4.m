c = imread('BF.png');
l_list = [];
num = [];

for l = 1:420
    count = 0;
    
    if (mod(420,l) ~= 0 || mod(560,l) ~= 0)
        continue;
    end
    
    l_list = [l_list, l];
    
    nr = 420/l;
    nc = 560/l;
    
    for i = 1:nr-1
        for j = 1:nc-1
            if length(find(c(i*l:(i+1)*l,j*l:(j+1)*l))) > 0
                count = count +1;
            end
        end
    end
    num = [num,count];
end

plot(log(l_list), log(num), 'b--o')
coefs = polyfit(log(l_list), log(num), 1);
dimension = -coefs(1);
            
            
    
    


