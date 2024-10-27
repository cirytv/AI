% Hechos sobre estudiantes y su situación
estudiante(maria).
estudiante(natalia).
trabaja(natalia).
trabaja(jorge).
casado(jorge).
independiente(natalia).
gusta(natalia, daniel).

% Reglas
joven(X) :- estudiante(X).
soltero(X) :- joven(X), \+ casado(X).
casado(X) :- trabaja(X), \+ estudiante(X).
soltero(X) :- independiente(X).
soltero(X) :- estudiante(X), trabaja(X), X \= maria.
incompatible(soltero, casado).
