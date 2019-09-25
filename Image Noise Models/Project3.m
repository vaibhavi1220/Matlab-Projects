image = zeros(256, 256);
[X,Y] = size(image); 
for i =1: X
for j =1 : Y
A = sqrt((i-(X/2))^2 + (j-(Y/2))^2);
if A <= 50
image(i,j)=100;
end        
end
end    
    

%Uniform noise model
a = -50;
b = 50;
uni = a + ((b - a))*rand(size(image));
image1 = image + uni;
figure(1)
imshow(uint8(image1));
title('Uniform noise + image');
figure(2)
histogram(uint8(image1));
title('Uniform noise');

%Salt and Pepper noise model
[D, E] = size(image);
a = -20;
b = 50;
A = .2;
B = .2;
X = rand(D);
n = zeros(D,E);
    
for i = 1: D
for j = 1: E 
if  X(i,j) < A
n(i,j) = a;
elseif X(i,j) <A+B
n(i,j) = b;
else
n(i,j) = 0;
end 
end
end
img2 = image + n;
figure(3)
imshow(uint8(img2));
title('Salt and Pepper noise + image');
figure(4)
histogram(uint8(img2));
title('Salt and Pepper');