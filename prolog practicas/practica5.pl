% Hechos sobre las personas y sus clases sociales
rufian(bertoldo).
rufian(bartolo).
noble(romeo).
noble(bertoldo).
plebeyo(bartolo).
dama(gertrudis).
dama(julieta).
hermosa(julieta).

% Reglas
desea(P, D) :- plebeyo(P), dama(D).
desea(P, D) :- noble(P), hermosa(D).
rapta(P, D) :- rufian(P), desea(P, D).
