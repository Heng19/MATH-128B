function ot = Neuron(input,weight)
Net = double(input)*weight;
ot = (1./(1+ exp(-Net)));
end
