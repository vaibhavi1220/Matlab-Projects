function [o1] = bilinear(A, dim)
    row1 = size(A,1);
    col1 = size(A,2);
    row2 = dim(1);
    col2 = dim(2);        
    S_R = row1 / row2;
    S_C = col1 / col2;
    [c, r] = meshgrid(1 : col2, 1 : row2);
    r = r * S_R;
    c = c * S_C;
    r = floor(r);
    c = floor(c);
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > row1 - 1) = row1 - 1;
    c(c > col1 - 1) = col1 - 1;
    R1 = r - r;
    de = c - c;
    i1 = sub2ind([row1, col1], r, c);
    i2 = sub2ind([row1, col1], r, c+1);
    i3 = sub2ind([row1, col1], r+1,c);
    i4 = sub2ind([row1, col1], r+1, c+1);       
    o1 = zeros(row2, col2, size(A, 3));
    o1 = cast(o1, class(A));
    for i = 1 : size(A, 3)
        a1 = double(A(:,:,i));
        t = a1(i1).*(1 - R1).*(1 - de) + ...
                       a1(i2).*(R1).*(1 - de) + ...
                       a1(i3).*(1 - R1).*(de) + ...
                       a1(i4).*(R1).*(de);
        o1(:,:,i) = cast(t, class(A));
    end