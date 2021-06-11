img1 = imread('images/input.jpeg');
img2 = imread('images/target.jpeg');
##img1 = rgb2gray(img1);
##img2 = rgb2gray(img2);

[out, Sk] = hist_spec(img1, img2);

imshow(out);