f = @(x) x.^2 - 2.*x + 5;
h = 0.25;

% =============================== SELISIH MAJU ===============================

function result = df_selisih_maju_h(f,x0,h)
    df = (f(x0+h) - f(x0))/h;
    result = df;
end

function result = df_selisih_maju_h2(f,x0,h)
    df = (-3*f(x0) + 4*f(x0+h) - f(x0+2*h)) / (2*h); % + O(h^2)
    result = df;
end

function result = df2_selisih_maju_h(f,x0,h)
    df2 = ( f(x0+2*h) - 2*f(x0+h) + f(x0) ) / (h^2); % + O(h)
    result = df2;
end
    
function result = df2_selisih_maju_h2(f,x0,h)
    df2 = ( -f(x0+3*h) + 4*f(x0+2*h) - 5*f(x0+h) + 2*f(x0) ) / 12*h; % + O(h^2)
    result = df2;
end

% =============================== SELISIH PUSAT ===============================
function result = df_selisih_pusat_h2(f,x0,h)
    df = ( f(x0+h) - f(x0-h) ) / (2*h); % + O(h^2)
    result = df;
end

function result = df_selisih_pusat_h4(f,x0,h)
    df = ( -f(x0+2*h) + 8*f(x0+h) - 8*f(x0-h) -f(x0-2*h) ) / (12 * h); % + O(h^2)
    result = df;
end

function result = df2_selisih_pusat_h2(f,x0,h)
    df = ( -f(x0+2*h) + 8*f(x0+h) - 8*f(x0-h) -f(x0-2*h) ) / (12 * h); % + O(h^2)
    result = df;
end