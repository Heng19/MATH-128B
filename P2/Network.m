function [syn0,syn1,Error,Rate] = Network(N_neuron)
load('mnist_all.mat')
Test_data = {train0',train1',train2',train3',train4',train5',train6',train7',train8',train9'};

X = cell2mat(Test_data)';
Y =[];

Error = [];
Rate = [];
for i = 1:10
    Y = [Y;zeros(size(Test_data{i},2),1)+i];
end

syn0 = (rand(784,N_neuron)-0.5)/sqrt(size(X,1));      

syn1 = (rand(N_neuron,10)-0.5)/sqrt(size(X,1));

eta = 0.02;

iteration = 1000;
for iter = 1:iteration
    l0 = X;

    l1 = Neuron(X,syn0,false);
    
    l2 = Neuron(l1,syn1,true);
    
    l2_delta = l2;
    
    for i = 1:size(Y,1)
        l2_delta(i,Y(i)) = l2_delta(i,Y(i)) - 1;
    end
    
    l1_delta = l2_delta*syn1'.* (l1.*(1-l1));
    
    syn1 = syn1 - 0.001*eta * l1'*l2_delta;
    
    syn0 = syn0 - 0.001*eta* double(X)'*l1_delta;
    
        
    if mod(iter,10) == 0
        [error,rate] = Error_Cal(X,syn0,syn1,Y);
        fprintf("Current %d%% \n",iter/iteration*100);
        fprintf("Log loss Error: %d \n",error);
        fprintf("Correctness Rate: %d \n", rate);
        Error = [Error,error];
        Rate = [Rate,rate];
    end
    
end