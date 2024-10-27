/*
Práctica 3.
Para una clase de una Universidad, se busca obtener conocimiento
en relación a si los alumnos aprobarán o no un examen de la
materia.
Tenemos el siguiente conocimiento directo:
- María, Alfredo, Tomás, Susana y Juan son alumnos
- Alfredo y María leen el libro de la materia
- Alfredo y María siempre asisten a clases
- Alfredo y María realizan los ejercicios
- Tomás sabe todo respecto a la materia
- María es tutor de Juan
- Juan es tutor de Susana
- María tiene 10 en el primer parcial y 10 en el segundo
- Alfredo tiene 10 en el primer parcial y 7 en el segundo
- Tomás tiene 10 en el primer parcial y 10 en el segundo
- Susana tiene 5 en el primer parcial y 6 en el segundo
- Juan tiene 7 en el primer parcial y 9 en el segundo
Además podemos aportar el siguiente conocimiento inferido:
- Si un alumno sabe todo sobre la materia entonces seguro está
preparado para el examen, pero de lo contrario, tendrá que asistir
siempre a clases, realizar los ejercicios y leer el libro de la materia
para estar preparado. Otra forma de estar preparado para el examen
es que el tutor del alumno esté preparado para el examen.
- Un alumno aprobará el examen si está preparado para dicho examen.
- Un alumno estará exento si tiene al momento un promedio de 10 y
siempre asiste a clases.
Construir un programa en Prolog que refleje dicho conocimiento y
permita resolver las siguientes cuestiones:
1. ¿Quiénes están preparados para el examen?
2. ¿Quién está exento?
3. ¿Quién aprueba el examen?
4. ¿Aprueba el examen Juan?
5. ¿Está Susana preparada para el examen?
6. ¿Quién es el sabio del grupo?
7. ¿Qué alumnos tienen promedio de 8?
8. ¿Cuál es el promedio que tiene Susana?
*/

% constants - estudiantes
maria.
alfredo.
tomas.
susana.
juan.

% hechos - son alumnos
alumno(maria).
alumno(alfredo).
alumno(tomas).
alumno(susana).
alumno(juan).

% hechos - leen libro de la materia
lee_libro(maria).
lee_libro(alfredo).

% hechos - siempre asisten a clases
asiste_clase(maria).
asiste_clase(alfredo).

% hechos - siempre realizan ejercicios
realiza_ejercicios(maria).
realiza_ejercicios(alfredo).

% hechos - sabe todo respecto a la materia
sabe_todo(tomas).

% hechos - es tutor
tutor(maria, juan).
tutor(juan, susana).



% hechos - notas del parcial
nota_parcial(maria, 10, 10).
nota_parcial(alfredo, 10, 7).
nota_parcial(tomas, 10, 10).
nota_parcial(susana, 5, 6).
nota_parcial(juan, 7, 9).

% Reglas
% Regla: Un alumno está preparado si sabe todo sobre la materia
preparado(X) :- sabe_todo(X).

% Regla: Un alumno está preparado si asiste a clases, lee el libro, y realiza los ejercicios.
preparado(X) :- asiste_clase(X), lee_libro(X), realiza_ejercicios(X).

% Regla: Un alumno está preparado si su tutor está preparado.
preparado(X) :- tutor(T, X), preparado(T).

% Regla: Un alumno está exento si tiene promedio de 10 y asiste a clases.
exento(X) :- nota_parcial(X, N1, N2), Promedio is (N1 + N2) / 2, Promedio =:= 10, asiste_clase(X).

% Regla: Un alumno aprueba el examen si está preparado.
aprueba(X) :- preparado(X).


% para saber el promedio consulta : nota_parcial(X, N1, N2), Promedio is (N1 + N2) / 2, Promedio =:= 8.