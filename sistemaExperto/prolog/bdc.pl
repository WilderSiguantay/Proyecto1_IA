% Estructura
estructura(invertebrado).
estructura(vertebrado).

% Grupos
grupo(molusco).
grupo(pez).
grupo(reptil).
grupo(ave).
grupo(mamifero).

% Clasificacion
pertenece_a(invertebrado, molusco).
pertenece_a(vertebrado, pez).
pertenece_a(vertebrado, reptil).
pertenece_a(vertebrado, ave).
pertenece_a(vertebrado, mamifero).

% Animales (nombre, id, altura, peso, anios, poblacion, velocidad)
% mamiferos
animal(caballo, 2,1.83, 1000, 40, 2000000, 65,0).
animal(leon, 3,1.25 , 260, 14, 7500, 59,0).
animal(elefante,4, 2.96, 7500, 70, 500000,40,0).
animal(tigre,5, 1.22,258,26,3890,90,0).
animal(leopardo,6, 0.9, 90, 17, 500, 58,0).

% aves
animal(ganso, 7,1.20, 8, 26, 500000,112,no_vuela).
animal(lechuza,8, 0.45, 0.55, 10, 50000, 80,vuela).
animal(loro, 9,1,4,80,1000,24,vuela).
animal(quetzal,10, 0.41,0.22,25,1000,20,vuela).
animal(aguila,11,0.78,7,30,419990,50,vuela).

% peces
animal(tiburon,12, 1,9,80,20000,70,0).
animal(barracuda,13, 2,20,15,50000,90,0).
animal(barbo,14,0.07,0.1,7,40000,0.225,0).
animal(mantarraya,15,9,1350,20,50000,45,0).
animal(mojarra,16,4,30,25,1000000,13,0).

% Reptiles
animal(caiman,17,6,399,40,50000,48,0).
animal(camaleon,18,0.68,2,8,100000,3,0).
animal(dragon_de_agua_asiatico,19,1,1,15,40000,10,0).
animal(cocodrilo,20, 7,1000,70,34000,35,0).
animal(dragon_de_komodo,21,3.1,150,40,2500,20,0).

% Moluscos
animal(babosa,22, 0.3,0.01,4,500000,0.01, terrestre).
animal(pulpo,23,6,2500,15,10000,43, marino).
animal(sepia, 24,0.5,10.5,3,50000,25,marino).
animal(caracol,25,80,0.01,20,1000000,0.01,terrestre).
animal(calamar,26,1.4,500,30,100000,30,marino).

% Clasificacion de animales

pertenece_a(mamifero,caballo).
pertenece_a(mamifero,leon).
pertenece_a(mamifero,elefante).
pertenece_a(mamifero,tigre).
pertenece_a(mamifero,leopardo).

pertenece_a(pez,tiburon).
pertenece_a(pez, barracuda).
pertenece_a(pez, barbo).
pertenece_a(pez, mantarraya).
pertenece_a(pez,mojarra).

pertenece_a(ave,ganso).
pertenece_a(ave,lechuza).
pertenece_a(ave,loro).
pertenece_a(ave,quetzal).
pertenece_a(ave,aguila).

pertenece_a(reptil,caiman).
pertenece_a(reptil,camaleon).
pertenece_a(reptil,dragon_de_agua_asiatico).
pertenece_a(reptil,cocodrilo).
pertenece_a(reptil,dragon_de_komodo).

pertenece_a(molusco, babosa).
pertenece_a(molusco,pulpo).
pertenece_a(molusco, sepia).
pertenece_a(molusco,caracol).
pertenece_a(molusco,calamar).

% relacionando vertebrados e invertebrados con los demas grupos y animales
contiene_a(X, Y):- pertenece_a(X, Y).
contiene_a(X, Y):- pertenece_a(X, Z), contiene_a(Z, Y).


% Animales (nombre, altura, peso, anios, poblacion, velocidad)
% LONGEVIDAD 
longevidad_baja(X) :- animal(X,_,_,_,Y,_,_,_), Y < 10.
longevidad_media(X) :- animal(X,_,_,_,Y,_,_,_), Y >=10, Y < 60.
longevidad_alta(X) :- animal(X,_,_,_,Y,_,_,_), Y >=60.

% VULNERABLE, EN PELIGRO
extinto(X) :- animal(X,_,_,_,_,Y,_,_), Y == 0.
vulnerable(X) :- animal(X,_,_,_,_,Y,_,_), Y < 5000.
sin_peligro(X):- animal(X,_,_,_,_,Y,_,_), Y >= 5000.

% PESO/TAMAñO
animal_grande(X) :- animal(X,_,Y,Z,_,_,_,_), (Z>50 ; Y>1).

animal_pequeno(X) :- animal(X,_,Y,Z,_,_,_,_), (Z=<50 ; Y=<1).

% VELOCIDAD

lento(X) :- animal(X,_,_,_,_,_,Y,_), Y < 3.6.

rapido(X) :- animal(X,_,_,_,_,_,Y,_), Y > 36.

vel_normal(X) :- animal(X,_,_,_,_,_,Y,_), Y >=3.6, Y =< 36.


tiene_vida(X) :- animal(X,_,_,_,_,_,_,_).

puede_respirar(X) :- animal(X,_,_,_,_,_,_,_).

puede_sentir(X) :- animal(X,_,_,_,_,_,_,_).



% Todos los reptiles tienen sangre fría.
sangre_fria(X,Y):- pertenece_a(X, Y), X=reptil.

% Algunos moluscos son marinos y otros son terrestres.
moluscos_marinos(X) :- animal(X,_,_,_,_,_,_,Y), Y=marino. 
moluscos_terrestres(X) :- animal(X,_,_,_,_,_,_,Y), Y=terrestre.

% Algunas aves pueden volar y otras no.
vuelan(X) :- animal(X,_,_,_,_,_,_,Y), Y=vuela.
no_vuelan(X) :- animal(X,_,_,_,_,_,_,Y), Y=no_vuela.


% Todos los reptiles tienen escamas.
tienen_escamas(X, Y):- pertenece_a(X, Y), X=reptil.

% Todos los peces viven en el agua.
viven_agua(X, Y):- pertenece_a(X, Y), X=pez.

% Todos los peces ponen huevos.
ponen_huevos(X,Y):- pertenece_a(X, Y), X=pez.

% Todas las aves tienen alas.
tienen_alas(X,Y):- pertenece_a(X, Y), X=ave.

% Todos los mamíferos tienen sangre caliente.
sangre_caliente(X,Y):- pertenece_a(X, Y), X=mamifero.

% Todos los mamíferos toman leche.
toman_leche(X,Y):- pertenece_a(X, Y), X=mamifero.


