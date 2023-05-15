%%Si nunca se ha conectado el arduino a octave:
%%arduinosetup  %%Se descarga la conf al arduino, Esto es sólo la primera vez
%%Si ya se descargo el arduinosetup la primer vez que se inicia el programa se
%%debe teclear
%pkg load arduino
%a=arduino;
%%Luego de eso el programa se puede ejecutar varias veces sin problema.

writePWMVoltage (a, 'd5', 0);
disp('Apagando sistema');
for k=0:0.5:1
  h=waitbar(k);
 pause(1)
endfor
delete(h);

disp('Inicio del experimento');


numCiclos=10;
z=1;


for(j=numCiclos:-1:1)
pasos=2.5/j;  %%Aquí cambiamos la frecuencia, la mínima cantidad de pasos para el for son 0-> 2.5-> 5
  for(i=0:pasos:5) %%Puede ser que cuando llegue a valores mayores de 2.5 el pasa automáticamente de 0 a 5 por varios ciclos
  tic;
  entrada(z)=i;
  writePWMVoltage (a, 'd5', double(i)); %%El pin d9 es incompatible
  pause(0.00001);
  datos(z)=readAnalogPin(a, "A0");
  pause(0.00001)
  Ts(z)=toc;
  z=z+1;
endfor


  for(i=5:-pasos:0)
  tic;
  entrada(z)=i;
  writePWMVoltage (a, 'd5', double(i)); %%El pin d9 es incompatible
  pause(0.00001);
  datos(z)=readAnalogPin(a, "A0");
  pause(0.00001)
  Ts(z)=toc;
  z=z+1;
  endfor

endfor

% Columna 1: Datos de entrada al horno
x = double(entrada');
%Hay que convertirlo por que las operaciones matriciales están definidas sólo para double
% Columna 2: Datos del comportamiento del horno
y = double(datos');

plot(y)

% Obtencion de los coeficientes de la ecuación en diferencias supuesta del modelo por medio de
% mínimos cuadrados (Amstrom, p513)

EcD = [-1*y(2:length(y)-1) -1*y(1:length(y)-2) x(2:length(y)-1) x(1:length(y)-2)];

Y = y(3:length(y));


Coeficientes=inv(EcD'*EcD)*EcD'*Y


c1 = Coeficientes(1);

c2 = Coeficientes(2);

c3 = Coeficientes(3);

c4 = Coeficientes(4);


%%%%% Comentar para la realimentación
w=y;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



for i = 3:length(y)
   w(i) = -c1*w(i-1) - c2*w(i-2) + c3*x(i-1) + c4*x(i-2); %%Poner mucho cuidado para no modificar esta línea de código
end

%%%%% Comentar para la realimentación

plot(Ts)

xlabel("Número de ciclos")

ylabel("Periodo de muestreo")


plot(entrada)

xlabel("Tiempo")

ylabel("Entrada")

figure

plot (y) % Comportamiento real

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hold on

plot (w,'m--') % Comportamiento proyectado con Ecuacion en diferencias


legend("Real","Modelo")

xlabel("Tiempo")

ylabel("Salida")

title("Sistema real vs Avatar")

hold off

grid on

disp('Error cuadrático medio del sistema:')

E=(sum((w-y).^2))/length(y)%%length(y) es el número de datos, este es el error cuadrático medio
