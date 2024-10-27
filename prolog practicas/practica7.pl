% Hechos sobre enfermedades y síntomas
padece(pedro, gripe).
padece(pedro, hepatitis).
padece(juan, hepatitis).
padece(maria, gripe).
padece(carlos, intoxicacion).
sintoma(gripe, fiebre).
sintoma(hepatitis, cansancio).
sintoma(intoxicacion, diarrea).
sintoma(gripe, cansancio).
suprime(aspirina, fiebre).
suprime(lomotil, diarrea).

% Reglas
alivia(Farmaco, Enfermedad) :- sintoma(Enfermedad, Sintoma), suprime(Farmaco, Sintoma).
deberia_tomar(Persona, Farmaco) :- padece(Persona, Enfermedad), alivia(Farmaco, Enfermedad).
