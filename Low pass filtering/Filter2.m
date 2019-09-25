a= imread('Knee.pgm');
[r, c] = size(a);
b = im2double(a);
[m,n] = size(b);

arr = zeros(2*m,2*n);
[p,q] = size(arr);
for i = 1:p
    for j = 1:q
        if i <= m && j<= n
            c(i,j) = b(i,j);
        else
            c(i,j) = 0;
        end
    end
end

%sFFT = fftshift(fft1);

d = zeros(p,q);

% Multiplying the padded image with (-1)^(x+y)
for i = 1:p
    for j = 1:q
        d(i,j) = c(i,j).*(-1).^(i + j);
    end
end

% Computing the 2D DFT
e = twoDdft(d);

% Generating the Real, Symmetric Filter Function
[x,y] = freqspace(p,'meshgrid');
z = zeros(p,q);
for i = 1:p
    for j = 1:q
        z(i,j) = sqrt(x(i,j).^2 + y(i,j).^2);
    end
end

%defining the low pass filter mask
H = zeros(p,q);
for i = 1:p
    for j = 1:q
        if z(i,j) <= 0.4  % here 0.4 is the cut-off frequency of the LPF
            H(i,j) = 1;
        else
            H(i,j) = 0;
        end
    end
end
figure;
imshow(H);

h1 = e.*H;
h2 = itwoDdft(h1);
h3 = zeros(p,q);
for i = 1:p
    for j = 1:q
        h3(i,j) = h2(i,j).*((-1).^(i+j));
    end
end
out = zeros(m,n);
for i = 1:m
    for j = 1:n
        out(i,j) = h3(i,j);
    end
end
figure;
imshow([b out]);
