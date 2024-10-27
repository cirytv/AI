/*
Práctica 4.
Escribir un programa Prolog que responda consultas acerca de a
dónde puede ir una determinada persona a comprarse fruta.
Tenemos el siguiente conocimiento directo:
• “La mejor” vende sandías, manzanas y melones.
• “La primera” vende cerezas, manzanas y naranjas.
• “La especial” vende moras, naranjas y uvas.
• A Camila le gustan las manzanas y las cerezas.
• A Pedro le gustan las sandías.
• A Lucía le gustan las moras y los melones.
- “La mejor” está en Bernal.
- “La primera” y “La especial” están en Mataderos.
- Camila y Pedro viven en Mataderos.
- Lucía vive en Bernal.
Tenemos también el siguiente conocimiento inferido:
- Decimos que una persona puede comprarse fruta en un local si en el
local venden alguna fruta que le gusta a la persona.
- Decimos que un local puede ofrecerle una fruta a una persona si el local
vende la fruta y a la persona le gusta la misma.
- Decimos que una persona puede ir caminando a comprarse frutas a un
local si puede comprar fruta en ese local y, además, el local está en el
barrio donde vive la persona.
- Decimos que una persona puede comprarse una fruta yendo a pie si a la
persona le gusta la fruta, hay algún local que venda la fruta, y el local
está en el barrio donde vive la persona.
Responder a las siguientes consultas:
1. ¿A dónde puede ir Camila a comprarse fruta?
2. ¿Quiénes pueden comprar fruta en “La mejor”?
3. ¿Qué fruta puede ofrecerle “La mejor” a Camila?
4. ¿A dónde puede ir caminando Camila a comprarse fruta?
5. ¿Quién puede ir caminando a comprar fruta a “La especial”?
6. ¿Qué frutas puede comprar Lucía yendo a pie?
*/

% Hechos sobre las tiendas y las frutas que venden
vende("La mejor", sandia).
vende("La mejor", manzana).
vende("La mejor", melon).
vende("La primera", cereza).
vende("La primera", manzana).
vende("La primera", naranja).
vende("La especial", mora).
vende("La especial", naranja).
vende("La especial", uva).

% Hechos sobre las preferencias de las personas
le_gusta(camila, manzana).
le_gusta(camila, cereza).
le_gusta(pedro, sandia).
le_gusta(lucia, mora).
le_gusta(lucia, melon).

% Hechos sobre la ubicación de las tiendas y las personas
ubicacion("La mejor", bernal).
ubicacion("La primera", mataderos).
ubicacion("La especial", mataderos).
vive(camila, mataderos).
vive(pedro, mataderos).
vive(lucia, bernal).

% Reglas
puede_comprar(Persona, Tienda) :- le_gusta(Persona, Fruta), vende(Tienda, Fruta).
ofrece_fruta(Tienda, Persona) :- vende(Tienda, Fruta), le_gusta(Persona, Fruta).
puede_ir_caminando(Persona, Tienda) :- puede_comprar(Persona, Tienda), vive(Persona, Barrio), ubicacion(Tienda, Barrio).
puede_comprar_a_pie(Persona, Fruta) :- le_gusta(Persona, Fruta), vende(Tienda, Fruta), vive(Persona, Barrio), ubicacion(Tienda, Barrio).
