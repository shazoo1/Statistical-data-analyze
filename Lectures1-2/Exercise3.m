bootstraped = bootstrap(randn(1000,1));
disp(bootstraped);
function s = bootstrap(x)
    s = bootstrp(1,@mean,x);
end