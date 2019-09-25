A = imread('MRI-brain.pgm');
B = bilinear(A, [200 150]);
C = bilinear(A, [400 450]);

figure; 
imshow(A);
title("Image 1");
figure;
imshow(B);
title("Small");
figure;
imshow(C);
title("Large");