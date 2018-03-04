T = ones(10,784);

for i = 1:10
    T(i,:) = mean(Test_data{1,i});
    digit = T(i,:);
    digitImage = reshape(digit,28,28);
    subplot(2,5,i);
    image(rot90(flipud(digitImage),-1)),
    colormap(gray(256)), axis square tight off;
end
