FiltreR=zeros(1024);
FiltreC=zeros(1024);

[im,map]=imread('puissance6.png');
size(im)
size(map)

MatRond_Vert=zeros(1024);
MatCheck_Vert=zeros(1024);
MatRond_Hor=zeros(1024);
MatCheck_Hor=zeros(1024);

[imR,map1]=imread('puissance6_rond.png');
[imC,map2]=imread('puissance6_check.png');

%vertical
for k=0:8:40
    for i=489+k:496+k
     for j=509:516
      MatRond_Vert(i,j)=imR(i-488-k,j-508);
      MatCheck_Vert(i,j)=imC(i-488-k,j-508);
     end
    end
end

%horizontal
for k=0:8:40
     for i=509:516
         for j=489+k:496+k
            MatRond_Hor(i,j)=imR(i-508,j-488-k);
             MatCheck_Hor(i,j)=imC(i-508,j-488-k);
         end
    end
end

flipud(im);
fliplr(im);

%Transformée de fourier
imDep=fft2(im);
imRond_Vert=fft2(MatRond_Vert);
imCheck_Vert=fft2(MatCheck_Vert);
imCheck_Hor=fft2(MatCheck_Hor);
imRond_Hor=fft2(MatRond_Hor);

%produit de corrélation
CorrRond_Vert=imRond_Vert.*imDep;
CorrCheck_Vert=imCheck_Vert.*imDep;
CorrRond_Hor=imRond_Hor.*imDep;
CorrCheck_Hor=imCheck_Hor.*imDep;

%transformée inverse
Rond_Vert=ifft2(CorrRond_Vert);
Check_Vert=ifft2(CorrCheck_Vert);
Rond_Hor=ifft2(CorrRond_Hor);
Check_Hor=ifft2(CorrCheck_Hor);


compt_Rond=0;
compt_Check=0;
%max
max_Check_H=max(max(Check_Hor));
max_Check_V=max(max(Check_Vert));
max_Rond_V=max(max(Rond_Vert));
max_Rond_H=max(max(Rond_Hor));
erreur=0.94;

for i=1:1024
    for j=1:1024
        if(Rond_Vert(i,j)>erreur*max_Rond_V)
           compt_Rond=compt_Rond+1;
        end
       if(Rond_Hor(i,j)>erreur*max_Rond_H) 
           compt_Rond=compt_Rond+1;
       end
        if(Check_Vert(i,j)>erreur*max_Check_V) 
           compt_Check=compt_Check+1;
        end
        if(Check_Hor(i,j)>erreur*max_Check_H) 
           compt_Check=compt_Check+1;
        end
    end
end

compt_Rond
compt_Check

if (compt_Rond>compt_Check)
    disp("Les Ronds ont gagné")
else
    disp("Les Checks ont gagné")
end