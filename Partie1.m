Te=10/16384;
t=zeros(1,16384);
f=zeros(1,16384);
x=zeros(1,16384);
fr=3266.8+2.5;%1633.4;%16334/2=8167

%échantillonage
j=3;
for i=1:16384
   t(1,i)=(i-1)*Te-5; 
   %if mod(t(1,i),2)<0.1 && mod(t(1,i),2)>-0.1
   %x(1,i)=5;  %version périodique de x5
   %x(1,i)=exp(j*2*pi*fr*t(1,i)); 
   %sin(2*pi*fr*t(1,i));
   %end
   %x(1,i)=exp(-pi*t(1,i)*t(1,i));
   
   %echantillonage et aliasing 
   x(1,i)=sin(2*pi*fr*t(1,i)) + sin(2*pi*(fr+5)*t(1,i)) + sin(2*pi*(fr+2*5)*t(1,i)) + 2*sin(2*pi*(fr+3*5)*t(1,i)); 
   f(1,i)=(i-1)*0.1-819.2;
end

X=tfour(x);
%fonction initiale
f1 = figure;
plot(t,x);

%partie imaginaire
f2 = figure;
plot(f,imag(X));

%partie réelle
f3 = figure;
plot(f,real(X));

%retour à la fonction initiale
Y=tfourinv(X);
f4=figure;
plot(t,Y);