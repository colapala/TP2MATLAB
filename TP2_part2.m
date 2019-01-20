FiltreR=zeros(1024);
FiltreC=zeros(1024);

[im,map]=imread('puissance6.png');
size(im)
size(map)

MatRond=zeros(1024);
MatCheck=zeros(1024);

[imR,map1]=imread('puissance6_rond.png');
[imC,map2]=imread('puissance6_check.png');

for i=509:516
   for j=509:516
      MatRond(i,j)=imR(i-508,j-508);
      MatCheck(i,j)=imC(i-508,j-508);
   end
end

flipud(im);
fliplr(im);

imDep=fft2(im);
imRond=fft2(MatRond);
imCheck=fft2(MatCheck);

CorrRond=imRond.*imDep;
CorrCheck=imCheck.*imDep;

%transformée inverse
Rond=ifft2(CorrRond);
Check=ifft2(CorrCheck);

k=0;
l=0;
for i=1:1024
    for j=1:1024
        if(Rond(i,j)>1e6)
           FiltreR(i,j)=Rond(i,j); 
           k=k+1;
        end
        if(Check(i,j)>8e5)
           FiltreC(i,j)=Check(i,j); 
           l=l+1;
        end
    end
end

surf(abs(FiltreR))
k
l
