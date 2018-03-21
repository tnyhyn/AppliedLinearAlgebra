function P = rowSpace(A)
    [K B] = rref(A');
    [n, m] = size(B);
    P = [];
    for m = 1:m
        temp = A(B(m),:)';
        P = [P temp];
    end   
end