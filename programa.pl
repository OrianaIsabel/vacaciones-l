% Aquí va el código.

% Punto 1

vaA(dodain,pehuenia).
vaA(dodain,sanMartin).
vaA(dodain,esquel).
vaA(dodain,sarmiento).
vaA(dodain,camarones).
vaA(dodain,playaDorada).

vaA(alf,bariloche).
vaA(alf,sanMartin).
vaA(alf,elBolson).

vaA(nico,marDelPlata).

vaA(vale,calafate).
vaA(vale,elBolson).

vaA(martu,Lugar):-
    vaA(alf,Lugar).

vaA(martu,Lugar):-
    vaA(nico,Lugar).

% Punto 2

tiene(esquel,parqueNacional(losAlerces)).
tiene(esquel,excursion(trochita)).
tiene(esquel,excursion(trevelin)).

tiene(pehuenia,cerro(bateaMahuida,2000)).
tiene(pehuenia,cuerpoAgua(moquehue,se_pesca,14)).
tiene(pehuenia,cuerpoAgua(alumine,se_pesca,19)).

esCopado(cerro(Nombre,Altura)):-
    tiene(_,cerro(Nombre,Altura)),
    Altura>2000.

esCopado(cuerpoAgua(Nombre,se_pesca,Temperatura)):-
    tiene(_,cuerpoAgua(Nombre,se_pesca,Temperatura)),
    Temperatura>20.

esCopado(playa(Nombre,DifMareas)):-
    tiene(_,playa(Nombre,DifMareas)),
    DifMareas<5.

esCopado(excursion(Nombre)):-
    tiene(_,excursion(Nombre)),
    atom_length(Nombre,Largo),
    Largo>7.

esCopado(parqueNacional(Nombre)):-
    tiene(_,parqueNacional(Nombre)).

vacCopadas(Persona,Lugar):-
    vaA(Persona,Lugar),
    tiene(Lugar,Atraccion),
    esCopado(Atraccion).

% Punto 3

seCruzaron(Persona1,Persona2):-
    vaA(Persona1,Lugar1),
    vaA(Persona2,Lugar2),
    Lugar1=Lugar2,
    Persona1\=Persona2.

noSeCruzaron(Persona1,Persona2):-
    forall((vaA(Persona1,Lugar1),vaA(Persona2,Lugar2)),Lugar1\=Lugar2),
    Persona1\=Persona2.

noSeCruzaron1(Persona1,Persona2):-
    vaA(Persona1,_),
    vaA(Persona2,_),
    not(seCruzaron(Persona1,Persona2)),
    Persona1\=Persona2.

% Punto 4

costoVida(sarmiento,100).
costoVida(esquel,150).
costoVida(pehuenia,180).
costoVida(sanMartin,150).
costoVida(camarones,135).
costoVida(playaDorada,170).
costoVida(bariloche,140).
costoVida(calafate,240).
costoVida(elBolson,145).
costoVida(marDelPlata,140).

esGasolero(Destino):-
    costoVida(Destino,Costo),
    Costo<160.

vacGasoleras(Persona):-
    vaA(Persona,_),
    forall(vaA(Persona,Destino),esGasolero(Destino)).

% Punto 5

esItinerario(Persona,Lista):-
    vaA(Persona,Lugar),
    member(Lugar,Lista),