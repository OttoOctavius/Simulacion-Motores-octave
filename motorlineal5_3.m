Bext = 0.4; %[T]
Va = 180; %[V]
Ra = 0.4; %[Oms]
l = 1;

%Determina la pendiente de integracion
m = 1; %[g]
dt=0.05; %[seg]
N = 100 ; %La cantidad de puntos, muy por encima

Ea = zeros(1,N); %[V]
v = zeros(1,N);
Ia = zeros(1,N);
F  = zeros(1,N);

y = 1:(N);

for i = y(2:end)

if(carga == 1)
  f = 25;
  else
  f = 0;
  end
  
Ia(i) =( Va - Ea(i-1) ) / Ra;
F(i) = ( Bext*l*Ia(i) ); %sin inercia , con: - v(i)/(Bext^2*l^2); % mal
v(i) = v(i-1) + dt * (F(i)-f) / m;
Ea(i) = Bext*l*v(i);
end

i = dt * y; 

Pmec = F.*v;
Pelec = Va*Ia;
n = Pmec ./ Pelec;

subplot(1,3,3);
%plot(i,Pmec,'g',i,Pelec,'y',i,n,'b');
plot(i,n,'b');

y = y(2:end);

i = dt * y; 

subplot(1,3,1);
title('Parametros Voltaje y Corriente en armadura, Velocidad vs tiempo');
plot(i,Ia(y),'y',i,Ea(y),'r',i,v(y),'g',0,500);

subplot(1,3,2);
plot(v(y),F(y));

