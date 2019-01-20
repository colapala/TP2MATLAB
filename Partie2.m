Te=10/16384;
t=zeros(1,16384);
f=zeros(1,16384);
x=zeros(1,16384);
s1 = zeros(1,16384);
s2 = zeros(1,16384);
d=zeros(1,16384);

f1  = 13;
f2 = 1;

for i=1:16384
   t(1,i)=(i-1)*Te-5; 
   
   s1(1,i) = cos(2*pi*2*t(1,i)) +cos(2*pi*4*t(1,i)) + cos(2*pi*6*t(1,i)) + cos(2*pi*8*t(1,i)) + cos(2*pi*10*t(1,i));
   s2(1,i) = 5*cos(2*pi*2*t(1,i)) + 4*cos(2*pi*4*t(1,i)) + 3 *cos(2*pi*6*t(1,i)) + 2*cos(2*pi*8*t(1,i)) + cos(2*pi*10*t(1,i));
   x(1,i)= s1(1,i)*cos(2*pi*f1*t(1,i)) + s2(1,i)*cos(2*pi*f2*t(1,i));
   d(1,i)=x(1,i)*cos(2*pi*f2*t(1,i));
   
   f(1,i)=(i-1)*0.1-819.2;
end

X=tfour(x);
S1 = tfour(s1);
S2 = tfour(s2);
D = tfour(d);

f1 = figure;
plot(t,x);

f2 = figure;
plot(f,real(X));

f3 = figure;
plot(f,real(S1));

f4=figure;
plot(t,real(S2));

f5 = figure;
plot(t,real(D));

f6 = figure;
plot(t,real(X)+real(D));