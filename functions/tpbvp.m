function [t, y] = tpbvp(a, b, n, alpha, beta, u, v, w, f)
    h = (b - a) / (n + 1);
    step = h + a;
    stop = 1;
    t = [];
    while stop < (n + 1)
        t    = cat(2,t,step);
        step = step + h;
        stop = stop + 1;
    end
    
    mainDiag(1:n)    = -(-4*u + 2*(h^2)*w);
    lowerDiag(1:n-1) = -(2*u - v*h);
    upperDiag(1:n-1) = -(2*u + v*h);
    
    md = diag(mainDiag);
    ud = diag(upperDiag,1);
    ld = diag(lowerDiag,-1);
    A = md + ud + ld;

    B = zeros(1,n);
    for k = 1:n
        B(k) = -(2*(h^2))*f(t(k)) ;
    end
    B(1) = B(1) - alpha*(-(2*u - v*h));
    B(n) = B(n) - beta*(-(2*u + v*h));
    
    y =  A \ B';
    y = [y'];
    t = [a t b];
    y = [alpha y beta];
end