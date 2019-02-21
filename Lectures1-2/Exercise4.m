bootstraped = bootstrap(randn(1000,1), 4);
disp(bootstraped);
function s = bootstrap(vector, samples_number)
    s = bootstrp(samples_number,@mean,vector);
end