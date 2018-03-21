function P = columnSpace(A)
    [K, B] = rref(A);
    [n, m] = size(B);
    P = [];
    for m = 1:m
        P = [P A(:,B(m))];
    end        
end