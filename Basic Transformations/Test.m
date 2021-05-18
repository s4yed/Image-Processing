img = imread('spine.tif');
img = rgb2gray(img);
img = im2double(img);

out = LogTrans(img);
imshow(out);
out = GammaTrans(img, 0.5);
imshow(out);
r1 = 0.2;
r2 = 0.8;
s1 = 0;
s2 = 255 / 256;
out = ConstantStretching(img, r1, r2, s1, s2);
imshow(out);
out = BitLevelSlicing(img, 7);
imshow(out);
out = Thresholding(img);
imshow(out);
