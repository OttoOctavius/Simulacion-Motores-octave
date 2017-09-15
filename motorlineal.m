Bext = 0.5; %[T]
Va = 120; %[V]
Ra = 0.25; %[Oms]
N = 400;
l = 0.5;
m = 1; %[g]
dt=0.05; %[seg]
Ea = zeros(N); %[V]
v = zeros(1,N);
y = 1:(N-1);
for i = y
Ia(i) =( Va - Ea(i) ) / Ra;

if( dt*i >  0)
  f = -20;
  else
  f = 0;
  end
F(i) = ( Bext*l*Ia(i) ); %sin inercia , con: - v(i)/(Bext^2*l^2); % mal
v(i+1) = v(i) + dt * (F(i)-f) / m;
Ea(i+1) = Bext*l*v(i);
end

plot(y,Ia(y),'y',y,Ea(y),'r',y,v(y),'g',0,500);
Pmec = F(y).*v(y);
Pelec = Va*Ia;