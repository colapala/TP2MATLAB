
IMNGF=zeros(512);
IMNGFTR = zeros(512);

[im,map]=imread('imtest01.png');
size(im)
size(map)

%imNG=0.3*im(:,:,1)+0.59*im(:,:,2)+0.11*im(:,:,3);
%size(imNG)

mapNG=([0:255]'/255)*[1 1 1];
%imNG=imNG(1:512,100:611);
colormap(mapNG)

IMNG=fft2(im);
IMNG2=fftshift(IMNG);


%size(IMNG2)
%surf(1:256,1:256,log(abs(IMNG2)))
image_log = log(abs(IMNG2));

maxImage = max(max(image_log));
minImage = min(min(image_log));

for i = 1:256
    for j = 1:256
        image_log(i,j) = 255*(image_log(i,j)-minImage)/(maxImage-minImage);
    end
end
figure(1)
image(image_log)
colormap(mapNG)

a=0.005;
%filtrage pase-bas gaussien
for i=1:256 
   for j=1:256
      IMNGF(i,j)= IMNG2(i,j)*exp(-a*((i-129)*(i-129)+(j-129)*(j-129)));
   end
end

%flitrage passe bas tout ou rien
k=15;
for i=129-k:129+k
   for j=129-k:129+k
      IMNGFTR(i,j) = IMNG2(i,j); 
   end
end

IMNG2=fftshift(IMNGF);
IMNGInv=ifft2(IMNG2);

IMNG3=fftshift(IMNGFTR);
IMNGInv2 = ifft2(IMNG3);

size(IMNGInv)
figure(2)
image(abs(IMNGInv))
colormap(mapNG)

figure(3)
image(abs(IMNGInv2))
colormap(mapNG)