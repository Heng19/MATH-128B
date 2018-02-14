% Inverse Iteration Methods

function julia_set = Inv_Iter(phi,x0)
count = 1;
julia_set = [];
julia_set = [julia_set, x0];


while(count < 100000)
    temp = [];
    
    for i = 1:count
        new_number =  phi(julia_set(i));
        temp = [temp, new_number, -new_number];
    end;
    
    julia_set = temp;
    count = length(julia_set);
end;
    






