finite_diff(f, x; h = sqrt(eps(typeof(x)))) = (f(x + h) - f(x - h)) / 2h
