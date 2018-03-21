function X = isLinearCombination(A,V)
    K = rref([A V]);
    rA = rank(A);
    rK = rank(K);
    if rA == rK
         X = 1;
    else
         X = 0;
    end

