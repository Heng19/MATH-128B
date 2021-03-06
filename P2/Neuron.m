function ot = Neuron(input,weight,softmax)
% Function take three parameters
% input: the data as a matrix
% weight: the weights for the input
% softmax: Bool

if softmax == false
    Net = double(input)*weight;
    ot = (1./(1+ exp(-Net)));
    
else
    Net = double(input)*weight;
    ot = exp(Net)./sum(exp(Net),2);  
end
end
