s = 0.01:0.005:1;
n_r = (1-s)*(2*pi*(coef*60)/2);  %vel [rad]
wsl=s*188.5;
rpm = n_r*30/pi;

%%---------Metodo Chapman---------------
num = 343.17 / coef ./ s;
den = (coef^2)*2.465 + (0.59+0.332 ./ s) .^2;
T_chap = num ./ den;

s_max = 0.198;
T_max = (343.17 / s_max) /( 2.465 + (0.59+0.332 / s_max) ^2);

printf("Maximo torque Chapman:");
max(T_chap)   %Ya lo calcule, pero tengo el S
printf("Torque Arranque Chapman:");
(T_chap(end))
printf("Torque maximo con S, para Chapman:");
T_max,s_max

%%---------Metodo Bose------------
num = 1118.08/3 / coef ./ s;
den = 2.465*(coef^2) + (0.641+0.332 ./ s) .^2;
T_bose = num ./ den;

printf("Maximo torque bose:");
[max_Tbose indiceBose]=max(T_bose);
max_Tbose
s(indiceBose)
printf("Torque Arranque bose:");
(T_bose(end))

%------------Lineal--------------------
T_lineal = zeros(1,length(s));
largo_lineal = 1:length(s)/12;
T_lineal = 1.5 * 4 *(460/sqrt(3))^2 .*s(largo_lineal) / ((2*pi*60)*0.332);


pot_chap=n_r.*T_chap/ 746;
pot_bose=n_r.*T_bose/ 746;


subplot(1,2,1);
plot(rpm,pot_chap,'r',rpm,pot_bose,'g',rpm, 15*ones(1,length(rpm)));
xlabel("velocidad angular [RPM]");
ylabel("Potencia [HP]");
title("Potencia-Velocidad ");
legend("Met. Chapman","Met. Bose");

subplot(1,2,2);
plot(rpm,T_chap,'r',rpm,T_bose,'g', rpm(largo_lineal), T_lineal(largo_lineal),'b');
xlabel("velocidad angular [RPM]");
ylabel("Torque [N*M]");
title("Torque-Velocidad");
legend("Met. Chapman","Met. Bose","lineal");

