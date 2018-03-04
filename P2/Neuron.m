function ot = Neuron(input,weight)
Net = 0
if length(input) ~= length(weight)
    warning('Incompatable Size of Input and Weight')
end
Net = input.*weight;
ot = 1/(1+ exp(-Net));
end
