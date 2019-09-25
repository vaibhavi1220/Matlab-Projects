function f2 = iDft(aa)
    L = length(aa);
    f2 = zeros(size(aa));
   % i = sqrt(-1);
    for k = 1 : L
        for n = 1 : L
            f2(k) = f2(k) + aa(n).* exp(2*1i*pi*(k-1)*(n-1)/L);
        end
    end
    %f2=f2/L;
 end