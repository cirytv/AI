# Prolog exercises

### Paso 1 - Install swi-prolog

## Run Prolog program

```sh
swipl -s file.pl
```

## practica 2

¿Existe algún múltiplo de 2?

```sh
divide(2, X).
```

¿Cuáles son los divisores de 6?

```sh
divide(X, 6).
```

¿Conocemos algún múltiplo de 6?

```sh
divide(6, X).
```

## practica 3

¿Quiénes están preparados para el examen?

```sh
preparado(X).
```

¿Quién está exento?

```sh
exento(X).
```

¿Quién aprueba el examen?

```sh
aprueba(X).
```

¿Aprueba el examen Juan?

```sh
aprueba(juan).
```

¿Está Susana preparada para el examen?

```sh
preparado(susana).
```

¿Quién es el sabio del grupo?

```sh
sabe_todo(X).
```

¿Qué alumnos tienen promedio de 8?

```sh
nota_parcial(X, N1, N2), Promedio is (N1 + N2) / 2, Promedio =:= 8.
```

¿Cuál es el promedio que tiene Susana?

```sh
nota_parcial(susana, N1, N2), Promedio is (N1 + N2) / 2.
```

## practica 4

¿A dónde puede ir Camila a comprarse fruta?

```sh
puede_comprar(camila, Tienda).
```

¿Quiénes pueden comprar fruta en "La mejor"?

```sh
puede_comprar(Persona, "La mejor").
```

¿Qué fruta puede ofrecerle "La mejor" a Camila?

```sh
ofrece_fruta("La mejor", camila).
```

¿A dónde puede ir caminando Camila a comprarse fruta?

```sh
puede_ir_caminando(camila, Tienda).
```

¿Quién puede ir caminando a comprar fruta a "La especial"?

```sh
puede_ir_caminando(Persona, "La especial").
```

¿Qué frutas puede comprar Lucía yendo a pie?

```sh
puede_comprar_a_pie(lucia, Fruta).
```

## practica 5

¿Qué noble es un rufián?

```sh
noble(X), rufian(X).
```

¿Quién es susceptible de ser raptada por Romeo?

```sh
desea(romeo, X).
```

¿Quién puede raptar a Julieta?

```sh
rapta(X, julieta).
```

¿Quién rapta a quién?

```sh
rapta(X, Y).
```

¿A quién desea Bartolo?

```sh
desea(bartolo, X).
```

¿A quién desea Romeo?

```sh
desea(romeo, X).
```

¿Cuál hermosa dama es deseada por Bartolo?

```sh
hermosa(D), desea(bartolo, D).
```

## practica 6

¿Podría casarse María con Daniel?

```sh
soltero(maria), gusta(natalia, daniel).
```

## practica 7

¿Podemos conocer qué dolencia tiene Pedro? ¿Y María?

```sh
padece(pedro, Enfermedad).
padece(maria, Enfermedad).
```

¿Quién padece gripe?

```sh
padece(X, gripe).
```

¿Qué síntomas tiene Pedro?

```sh
padece(pedro, Enfermedad), sintoma(Enfermedad, Sintoma).
```

¿Quién padece diarrea?

```sh
padece(X, Enfermedad), sintoma(Enfermedad, diarrea).
```

¿Y quién está cansado?

```sh
padece(X, Enfermedad), sintoma(Enfermedad, cansancio).
```

¿Hay algún fármaco que alivie a Pedro?

```sh
alivia(Farmaco, Enfermedad), padece(pedro, Enfermedad).
```

¿Hay algún síntoma que compartan Juan y María?

```sh
padece(juan, E1), padece(maria, E2), sintoma(E1, Sintoma), sintoma(E2, Sintoma).
```

## practica 8

¿Con quiénes puede trabajar Pedro?

```sh
puede_trabajar_junto(pedro, X).
```

¿Quiénes pueden trabajar juntos?

```sh
puede_trabajar_junto(X, Y).
```

¿Quiénes pueden trabajar en el proyecto B?

```sh
puede_trabajar_en_proyecto(X, b).
```

¿Qué proyectos se pueden encarar?

```sh
proyecto_encarable(P).
```
