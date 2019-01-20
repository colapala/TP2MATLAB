function TP2_part1_exemple

[im,map]=imread('tondeuse-honda-hrd536-ctx-53cm-3-vitesses-1.jpeg');
size(im)
size(map)

figure(1)
image(im)

%im(200:400,200:400,2)=0; supprime le vert 
figure(2)
image(im)

%niveau de gris
imNG=0.3*im(:,:,1)+0.59*im(:,:,2)+0.11*im(:,:,3);
size(imNG)
figure(3)
image(imNG)

%création d'une matrice map pour appliquer les niveaux de gris 
mapNG=([0:255]'/255)*[1 1 1];
imNG=imNG(1:512,100:611);
colormap(mapNG)
figure(3)
image(imNG)

%representation en fréquence de l'image en NG
IMNG=fft2(imNG); %centrée en haut à gauche

IMNG2=fftshift(imNG); %centrée 

%ifft2 pour inverser
