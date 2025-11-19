-- Gabarito: Exercício 2 (DROP TABLE)

-- É crucial apagar a tabela 'filha' (REGISTRO) primeiro
-- para não violar as chaves estrangeiras.
DROP TABLE REGISTRO;

-- Depois, apague as tabelas 'pai' (EXTRATO e TIPO_REGISTRO).
-- A ordem entre elas não importa.
DROP TABLE EXTRATO;
DROP TABLE TIPO_REGISTRO;