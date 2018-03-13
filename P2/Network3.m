function [syn0,syn1,syn2,syn3,Error,Rate] = Network(N1,N2,N3)

load('mnist_all.mat')
Test_data = {train0',train1',train2',train3',train4',train5',train6',train7',train8',train9'};

X = cell2mat(Test_data)';
Y =[];

Error = [];
Rate = [];
for i = 1:10
    Y = [Y;zeros(size(Test_data{i},2),1)+i];
end

syn0 = (rand(784,N1)-0.5)/sqrt(size(X,1))/10;      

syn1 = (rand(N1,N2)-0.5)/sqrt(size(X,1))/10;

syn2 = (rand(N2,N3)-0.5)/sqrt(size(X,1))/10;

syn3 = (rand(N3,10)-0.5)/sqrt(size(X,1))/10;

eta = 0.0001;

iteration = 1000;
for iter = 1:iteration
    l0 = X;

    l1 = Neuron(l0,syn0,false);
    
    l2 = Neuron(l1,syn1,false);
    
    l3 = Neuron(l2,syn2,false);
    
    l4 = Neuron(l3,syn3,true);
    
    l4_delta = l4;
    
    for i = 1:size(Y,1)
        l4_delta(i,Y(i)) = l4_delta(i,Y(i)) - 1;
    end
    
    l3_delta = l4_delta*syn3'.* (l3.*(1-l3));
    
    l2_delta = l3_delta*syn2'.* (l2.*(1-l2));
    
    l1_delta = l2_delta*syn1'.* (l1.*(1-l1));
    
    syn3 = syn3 - 0.001*eta * l3'*l4_delta;
    
    syn2 = syn2 - 0.001*eta * l2'*l3_delta;
    
    syn1 = syn1 - 0.001*eta* l1'*l2_delta;
    
    syn0 = syn0 - 0.001*eta* double(X)'*l1_delta;

    if mod(iter,10) == 0
        [error,rate] = Error_Cal3(X,syn0,syn1,syn2,syn3,Y);
        fprintf("Current %d%% \n",iter/iteration*100);
        fprintf("Log loss Error: %d \n",error);
        fprintf("Correctness Rate: %d \n", rate);
        Error = [Error,error];
        Rate = [Rate,rate];
    end
end
end