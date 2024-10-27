% Hechos sobre habilidades de las personas
maneja(juan, pascal).
maneja(juan, clipper).
maneja(juan, prolog).
maneja(pedro, clipper).
maneja(pedro, basic).
maneja(ofelia, basic).
maneja(ofelia, pascal).
maneja(diana, pascal).
maneja(diana, access).
maneja(diana, prolog).

% Hechos sobre proyectos y tecnologías
proyecto(a, [prolog]).
proyecto(b, [access, basic]).
proyecto(c, [pascal]).
proyecto(d, [access]).
asignado(juan, c).

% Reglas
puede_trabajar_junto(X, Y) :- maneja(X, Herramienta), maneja(Y, Herramienta), X \= Y.
puede_trabajar_en_proyecto(X, P) :- proyecto(P, Tecnologias), member(T, Tecnologias), maneja(X, T).
