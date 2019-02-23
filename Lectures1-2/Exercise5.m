%Generate two correlating vectors%
input_mean = 10
sigma = 2
M = input_mean + sigma*randn(1000,2);
R = [1 0.8; 0.8 1];
L = chol(R)
M = M*L;
vector1 = M(:,1);
vector2 = M(:,2);
%Prove the correlation%
correlation = corr(vector1, vector2)

%Visualizing the data with use of scatter plot%
figure; hold on;
scatter(vector1, vector2, 'r.')
hold off;

%Visualize both variables on the same bar chart%
figure; hold on;
hist([vector1, vector2], 50);
hold off;

d = marginaldist(vector1, vector2);