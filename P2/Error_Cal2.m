function [error,rate] = Error_Cal(X,syn0,syn1,syn2,Y)
l1 = Neuron(X,syn0,false);
    
l2 = Neuron(l1,syn1,false);

l3 = Neuron(l2,syn2,true);
error = 0;
rate = 0;
    for i = 1:size(Y,1)
       error = error -log(l3(i,Y(i))) ;
       [value,index] = max(l3(i,:));
       if index == Y(i)
           rate = rate + 1;
       end
    end
error = error/size(Y,1);
rate  = rate/size(Y,1);
end     
