load('mnist_all.mat')
X = [train0',train1']';
Y = [zeros(5923,1);ones(6742,1)];

syn0 = rand(784,3)*0.001 -0.0005;

syn1 = (rand(3,1)-0.5);

for iter = 1:10000
    if mod(iter,100) == 0
        fprintf("Current %d%% \n",iter/10000)
    end
    l0 = X;

    l1 = Neuron(X,syn0);
    
    l2 = Neuron(l1,syn1);

    Error = Y -l2;
    
    l2_delta = Error.*(l2.*(1-l2));
    
    l1_delta = l2_delta*syn1'.* (l1.*(1-l1));
    
    eta = (0.1-0.01)*rand(1)+0.01;
    
    syn1 = syn1 + eta * l1'*l2_delta;
    
    syn0 = syn0 + double(X)'*l1_delta;
end