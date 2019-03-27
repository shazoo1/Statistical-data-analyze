%Exercise 1. Write a function that calculates the correlation between two
%input vectors. Use only MATLAB functions (mean, std, etc.)
vector1 = randn(1000,1);
vector2 = randn(1000,1);
correlation = corr(vector1, vector2);

%Exercise 2. Conduct Monte Carlo simulations in which samples are drawn 
%from ? Gaussian distribution with mean 10 and standard deviation 2. 
%For each of various sample sizes (? = 2, 5, 10, 20, 50,100,200,500, 1000),
%draw 1,000 random samples, compute the mean of each sample, and quantify 
%the spread in the results ?? computing standard deviation. Then make ? 
%line plot that shows the relationship between sample size (x-axis) and 
%the uncertainty (spread) of the mean (y-axis). On the same figure, draw ? 
%line that shows the theoretical expectation.
inputstddev = 2;
inputmean = 10;
samplesize = 1000;

results = zeros(1,1000);
sample_sizes = [2,5,10,20,50,100,200,500,1000];
devs = [];
expected_devs = [];

for i=1:length(sample_sizes)
        means = zeros(1,1000);
        for j=1:1000
            vector1 = inputmean + randn(sample_sizes(i),1)*inputstddev;
            means(j) = mean(vector1);
        end
        stDeviation = std(means);
        devs(end+1) = stDeviation;
        expected_devs(end+1) = 2 / sqrt(sample_sizes(i));
end

figure; hold on;
plot(sample_sizes, devs, 'b-o');
plot(sample_sizes, expected_devs, 'r-');
xlabel('Sample size');
ylabel('Uncertainty of the mean');
hold off;

legend('Real deviation','Expected deviation')

%Exercise 3. Write ? function that accepts an input vector and retums ? new vector representing ? bootstrap sample drawn from the original vector. 
bootstraped = bootstrap(randn(1000,1));
disp(bootstraped);


%Exercise 4. Modify the function in Exercise 3 to accept another input specifying the number of bootstrap samples to draw. Then have the function retum ? 2D matrix with different bootstrap samples in the columns of the matrix. Avoid the use of for-loops in this function so that the function is fast. 
bootstraped = bootstrap(randn(1000,1), 4);
disp(bootstraped);

%Exercise 5. Generate some co?elated data (two varia?es). Visualize the data using ? scatter plot. Then compute ? 2D histogram of these data and visualize the histogram as an image. Compute the marginal distribution of the data (showing the distribution of the data on each varia?e separately) and then compute the joint distribution that we would expect to observe if the varia?es were independent. Visualize this distribution as an image.
%Generate two correlating vectors%
input_mean = 10;
sigma = 2;
M = input_mean + sigma*randn(1000,2);
R = [1 0.8; 0.8 1];
L = chol(R);
M = M*L;
vector1 = M(:,1);
vector2 = M(:,2);
%Prove the correlation%
correlation = corr(vector1, vector2);

%Visualizing the data with use of scatter plot%
figure; hold on;
scatter(vector1, vector2, 'r.')
hold off;

%Visualize both variables on the same bar chart%
figure; hold on;
hist([vector1, vector2], 50);
hold off;

d = marginaldist(vector1, vector2);
d;

%Exercise 3
function s = bootstrap(x)
    s = bootstrp(1,@mean,x);
end

%Exercise 4
function s = bootstrap(vector, samples_number)
    s = bootstrp(samples_number,@mean,vector);
end