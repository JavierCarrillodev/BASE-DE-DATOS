USE dragonball;

-- TEST 1: Comprobar si Gohan ha sido insertado correctamente
SELECT CASE
         WHEN COUNT(*) = 1 THEN 'TEST 1 PASADO: Gohan insertado correctamente'
         ELSE 'TEST 1 FALLADO: Gohan no encontrado'
       END AS resultado
FROM guerreros
WHERE nombre = 'Gohan' AND raza = 'Saiyan-Humano' AND nivel_poder = 7500;

-- TEST 2: Comprobar si Vegeta tiene nivel de poder 9500
SELECT CASE
         WHEN nivel_poder = 9500 THEN 'TEST 2 PASADO: Nivel de poder de Vegeta actualizado correctamente'
         ELSE 'TEST 2 FALLADO: Nivel de poder de Vegeta incorrecto'
       END AS resultado
FROM guerreros
WHERE nombre = 'Vegeta';

-- TEST 3: Comprobar si la técnica "Masenko" ha sido insertada y asociada a Gohan
SELECT CASE
         WHEN COUNT(*) = 1 THEN 'TEST 3 PASADO: Técnica Masenko insertada y asociada correctamente'
         ELSE 'TEST 3 FALLADO: Técnica Masenko no asociada correctamente'
       END AS resultado
FROM guerrero_tecnica gt
JOIN guerreros g ON gt.id_guerrero = g.id
JOIN tecnicas t ON gt.id_tecnica = t.id
WHERE g.nombre = 'Gohan' AND t.nombre_tecnica = 'Masenko';
