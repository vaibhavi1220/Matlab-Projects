function A = oneDdft(aa)
    L = length(aa);
    A = zeros(size(aa));
    %i = sqrt(-1);
    for k = 1 : L
        for n = 1 : L
            A(k) = A(k) + aa(n) * exp(-2*1i*pi*(k-1)*(n-1)/L);
        end
    end 
end