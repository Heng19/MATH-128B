load('mnist_all.mat')
Test_data = {train0,train1,train2,train3,train4,train5,train6,train7,train8,train9};
for i = 1:5
    digit = train0(i,:);
    digitImage = reshape(digit,28,28);
    subplot(3,5,i);
    image(rot90(flipud(digitImage),-1)),
    colormap(gray(256)), axis square tight off;
end
for i = 1:5
    digit = train1(i,:);
    digitImage = reshape(digit,28,28);
    subplot(3,5,i+5);
    image(rot90(flipud(digitImage),-1)),
    colormap(gray(256)), axis square tight off;
end
for i = 1:5
    digit = train2(i,:);
    digitImage = reshape(digit,28,28);
    subplot(3,5,i+10);
    image(rot90(flipud(digitImage),-1)),
    colormap(gray(256)), axis square tight off;
end