/*
Práctica 2. Divisible
Supongamos que tenemos el siguiente conocimiento sobre divisibilidad:
" 2 divide a 6"
" 2 divide a 12"
" 3 divide a 6"
" 3 divide a 12"
" Si un número es divisible por 2 y por 3 entonces es divisible por 6"
Escribir un programa que represente este conocimiento y usarlo para
responder a las siguientes preguntas:
(1) ¿Existe algún múltiplo de 2?
(2) ¿Cuáles son los divisores de 6?
(3) ¿Conocemos algún múltiplo de 6?
*/

% Hechos básicos de divisibilidad
divide(2, 6).
divide(2, 12).
divide(3, 6).
divide(3, 12).

% Regla: Un número es divisible por 6 si es divisible por 2 y 3
divide(6, X) :- divide(2, X), divide(3, X).
