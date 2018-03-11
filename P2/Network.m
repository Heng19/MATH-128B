load('mnist_all.mat')
Test_data = {train0',train1',train2'};%,train3',train4',train5',train6',train7',train8',train9'};

X = cell2mat(Test_data)';

Y = [zeros(size(Test_data{1},2),1)+1;zeros(size(Test_data{2},2),1)+2;zeros(size(Test_data{3},2),1)+3];

syn0 = rand(784,3)*0.001 -0.0005;          

syn1 = (rand(3,3)*0.001-0.0005);

for iter = 1:
    if mod(iter,100) == 0
        fprintf("Current %d%% \n",iter/100)
    end
    l0 = X;

    l1 = Neuron(X,syn0,false);
    
    l2 = Neuron(l1,syn1,true);
    
    l2_delta = l2;
    for i = 1:size(Y,1)
        l2_delta(i,Y(i)) = l2_delta(i,Y(i)) - 1;
    end
    

   % Error = Y -l2;
    
   % l2_delta = Error.*(l2.*(1-l2));
    
    l1_delta = l2_delta*syn1'.* (l1.*(1-l1));
    
    eta = (0.1-0.01)*rand(1)+0.01;
    
    syn1 = syn1 + eta * l1'*l2_delta;
    
    syn0 = syn0 + double(X)'*l1_delta;
    
end