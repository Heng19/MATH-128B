X = [train0',train1']';
Y = [zeros(5923,1);ones(6742,1)];

syn0 = (rand(1,784)*0.001 -0.0005)';

for iter = 1:2

    l1 = Neuron(X,syn0);
    
    l1_error = Y - l1;
    
    l1_delta = l1_error.*(l1.*(1-l1));
    
    syn0 = syn0 + double(l0)'*l1_delta;
end