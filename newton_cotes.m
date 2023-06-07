f = @(x) x.^2 - 2.*x + 5
x = 1:0.25:4;
y = f(x);
h = 0.25;

function result = newton_cotes_trapezoid(y,h)
    if length(y) < 2
        error('too few data points');
        return;
    end
    result = (h/2)*( y(1) + 2*sum(y(2:end-1)) + y(end))
    return;
end

function result = newton_cotes_simpson_1_3(y,h)
    if length(y) < 3
        error('too few data points');
        return;
    end
    result = (h/3)*( y(1) + 4*sum(y(1:2:end-1)) + 2*sum(y(2:2:end-1)) + y(end))
    return;
end

function result = newton_cotes_simpson_1_8(y,h)
    if length(y) < 3
        error('too few data points');
        return;
    end
    mul_of_3 = y(3:3:end-1);
    not_mul_of_3 = y(mod(1:length(y)-1, 3) ~= 0);
    result = (3*h/8)*( y(1) + 3*sum(not_mul_of_3(2:end)) + 2*sum(mul_of_3) + y(end))
    return;
end

trapezoid = newton_cotes_trapezoid(y,h);
rule1_3 = newton_cotes_simpson_1_3(y,h);
rule1_8 = newton_cotes_simpson_1_8(y,h);