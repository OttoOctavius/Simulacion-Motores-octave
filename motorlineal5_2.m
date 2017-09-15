Bext = 0.5; %[T]
Va = 120; %[V]
Ra = 0.25; %[Oms]
l = 0.5;

%Determina la pendiente de integracion
m = 1; %[g]
dt=0.05; %[seg]
N = 400; %La cantidad de puntos, muy por encima

Ea = zeros(1,N); %[V]
v = zeros(1,N);
Ia = zeros(1,N);
F  = zeros(1,N);

y = 1:(N);
f = 0;

if j == 0
 f = 20; 
end
if j == 3
 f = 20;  Bext = 0.45;
end
if j == 6
 f = 20; Bext = 0.45;  Va = 100;
end

for i = y(2:end)
  
Ia(i) =( Va - Ea(i-1) ) / Ra;
F(i) = ( Bext*l*Ia(i) ); %sin inercia , con: - v(i)/(Bext^2*l^2); % mal
v(i) = v(i-1) + dt * (F(i)-f) / m;
Ea(i) = Bext*l*v(i);
end

x = dt * y; 

Pmec = F.*v;
Pelec = Va*Ia;
n = Pmec ./ Pelec;

subplot(3,3,3+j);
%plot(x,Pmec,'g',x,Pelec,'y',x,n,'b');
plot(x,n);

y = y(2:end);

i = dt * y; 

subplot(3,3,1+j);
title('Parametros Voltaje y Corriente en armadura, Velocidad vs tiempo');
plot(i,Ia(y),'y',i,Ea(y),'r',i,v(y),'g',0,500);

subplot(3,3,2+j);
plot(v(y),F(y));

