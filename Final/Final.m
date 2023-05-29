%%Si nunca se ha conectado el arduino a octave:
%%arduinosetup  %%Se descarga la conf al arduino, Esto es sólo la primera vez
%%Si ya se descargo el arduinosetup la primer vez que se inicia el programa se
%%debe teclear
%pkg load arduino
%a=arduino;
%%Luego de eso el programa se puede ejecutar varias veces sin problema.

% Columna 1: Datos de entrada al horno
x = [0
1/4
1/2
3/4
1
5/4
3/2
7/4
2
9/4
5/2
11/4
3
13/4
7/2
15/4
4
17/4
9/2
19/4
5
5
19/4
9/2
17/4
4
15/4
7/2
13/4
3
11/4
5/2
9/4
2
7/4
3/2
5/4
1
3/4
1/2
1/4
0
0
5/18
5/9
5/6
10/9
25/18
5/3
35/18
20/9
5/2
25/9
55/18
10/3
65/18
35/9
25/6
40/9
85/18
5
5
85/18
40/9
25/6
35/9
65/18
10/3
55/18
25/9
5/2
20/9
35/18
5/3
25/18
10/9
5/6
5/9
5/18
0
0
5/16
5/8
15/16
5/4
25/16
15/8
35/16
5/2
45/16
25/8
55/16
15/4
65/16
35/8
75/16
5
5
75/16
35/8
65/16
15/4
55/16
25/8
45/16
5/2
35/16
15/8
25/16
5/4
15/16
5/8
5/16
0
0
5/14
5/7
15/14
10/7
25/14
15/7
5/2
20/7
45/14
25/7
55/14
30/7
65/14
5
5
65/14
30/7
55/14
25/7
45/14
20/7
5/2
15/7
25/14
10/7
15/14
5/7
5/14
0
0
5/12
5/6
5/4
5/3
25/12
5/2
35/12
10/3
15/4
25/6
55/12
5
5
55/12
25/6
15/4
10/3
35/12
5/2
25/12
5/3
5/4
5/6
5/12
0
0
1/2
1
3/2
2
5/2
3
7/2
4
9/2
5
5
9/2
4
7/2
3
5/2
2
3/2
1
1/2
0
0
5/8
5/4
15/8
5/2
25/8
15/4
35/8
5
5
35/8
15/4
25/8
5/2
15/8
5/4
5/8
0
0
5/6
5/3
5/2
10/3
25/6
5
5
25/6
10/3
5/2
5/3
5/6
0
0
5/4
5/2
15/4
5
5
15/4
5/2
5/4
0
0
5/2
5
5
5/2
0];















y = [286
354
90
169
128
170
4
6
101
29
23
23
0
21
21
2
1
13
17
118
108
193
72
134
1
10
96
0
6
53
22
84
12
3
49
40
94
140
142
160
133
424
483
271
158
123
125
67
10
27
117
139
15
9
147
9
32
36
76
87
353
250
58
38
68
12
1
79
19
45
33
32
38
24
52
36
144
237
92
271
357
547
184
38
30
5
87
222
60
36
7
83
27
31
63
76
393
330
86
13
143
20
22
31
35
62
110
134
69
168
145
85
230
285
485
430
136
24
26
119
33
45
24
6
62
39
72
32
344
421
92
30
31
0
92
38
27
46
31
135
145
26
216
254
476
340
41
23
16
67
46
33
23
38
61
103
336
418
65
32
28
40
22
128
99
59
44
72
386
313
312
170
45
134
50
59
31
68
43
33
510
542
109
20
15
89
109
36
9
109
213
345
430
36
36
96
72
34
22
39
185
260
68
37
39
54
118
54
169
222
368
156
140
27
79
77
335
389
30
30
110
160
74
261
261
35
60
24
376
454
82
26
3
169
220
176
217
220
11
126];

plot(y)

% Obtencion de los coeficientes de la ecuación en diferencias supuesta del modelo por medio de
% mínimos cuadrados (Amstrom, p513)


EcD = [-1*y(2:length(y)-1) -1*y(1:length(y)-2) x(2:length(y)-1) x(1:length(y)-2)];
% -1*y(1:length(y)-3) x(1:length(y)-3)
Y = y(3:length(y));


Coeficientes=inv(EcD'*EcD)*EcD'*Y

c1 = Coeficientes(1);
c2 = Coeficientes(2);
c3 = Coeficientes(3);
c4 = Coeficientes(4);
%c5 = Coeficientes(5);
%c6 = Coeficientes(6);


%%%%% Comentar para la realimentación
w=y;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



for i = 3:length(y)
   w(i) = -c1*w(i-1) - c2*w(i-2) + c3*x(i-1) + c4*x(i-2); %%Poner mucho cuidado para no modificar esta línea de código
end
% - c3*w(i-3) + c6*x(i-3)
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
