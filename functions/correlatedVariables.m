function A = correlatedVariables(m, n, C, Mu)
    R = chol(C);
    Z = zeros(m,n);
    for n = 1:n
        y = randn(m,1);
        Z(:,n) = y;
    end
    X = Z*R;
    A = zeros(m,n);
    for n = 1:n
        temp = Mu(n) + X(:,n);
        A(:,n) = temp;
    end
end