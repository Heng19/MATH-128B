X = [train0',train1']';
Y = [zeros(5923,1);ones(6742,1)];

syn0 = (rand(3,784)*0.001 -0.0005)';

syn1 = (rand(3,3)-0.5);

for iter = 1:10
    
    l0 = X;

    l1 = Neuron(X,syn0);
    
    l2 = Neuron(l1,syn1);
    
    
    output = sum(l2,2);
    
    Error = Y - output;
    
    l1_delta = l1_error.*(l1.*(1-l1));
    
    syn0 = syn0 + double(l0)'*l1_delta;
end