load('mnist_all.mat');
Test_data = {test0',test1',test2',test3',test4',test5',test6',test7',test8',test9'};
X = cell2mat(Test_data)';
Y =[];
for i = 1:10
    Y = [Y;zeros(size(Test_data{i},2),1)+i];
end


[syn0_10,syn1_10,syn2_10,syn_3_10,Error_10,Rate_10] = Network3(200,200,200);
[error_10,rate_10] = Error_Cal3(X,syn0_10,syn1_10,syn2_10,syn3_10,Y);

[syn0_20,syn1_20,syn2_20,Error_20,Rate_20] = Network2(20,10);
[error_20,rate_20] = Error_Cal2(X,syn0_20,syn1_20,syn2_20,Y);

[syn0_50,syn1_50,syn2_50,Error_100,Rate_100] = Network2(50,10);
[error_100,rate_100] = Error_Cal2(X,syn0_50,syn1_50,syn2_50,Y);

x = linspace(1,100,100);

plot(x,Error_10,x,Error_20,x,Error_100);
title('Log Loss Error');
legend('n = (10,10)','n = (20,10)','n = (50,10)');

plot(x,Rate_10,x,Rate_20,x,Rate_100);
title('Accurancy on the Traning Set');
legend('n = (10,10)','n = (20,10)','n = (50,10)','location','southeast');