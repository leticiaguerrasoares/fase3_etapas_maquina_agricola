-- ===========================================================
-- FASE 3 – Banco de Dados (FIAP)
-- Autores:
--   • Letícia Angelim Guerra
--   • Matheus Guimarães França
--   • Rivando Bezerra Cavalcanti Neto
--   • Tales Ferraz de Arruda Domienikan
--   • João Rafael Gonçalves Ramos

-- Objetivo: Consultas sobre dados importados dos sensores
-- Banco: Oracle SQL Developer
-- Tabela: SENSORES_FARMTECH
-- ===========================================================


-- 1. SELECT GERAL (verificação de importação)
SELECT * 
FROM SENSORES_FARMTECH
FETCH FIRST 20 ROWS ONLY;



-- 2️. FILTRAGEM (WHERE - umidade do solo acima de 70)
SELECT * 
FROM SENSORES_FARMTECH
WHERE UMIDADE_SOLO > 70
ORDER BY CREATED_AT;



-- 3. ORDENAÇÃO (ORDER BY - pH do solo decrescente)
SELECT *
FROM SENSORES_FARMTECH
ORDER BY PH_SOLO DESC
FETCH FIRST 10 ROWS ONLY;



-- 4️. ESTATÍSTICAS (AVG / MAX / MIN - umidade do solo)
SELECT
  ROUND(AVG(UMIDADE_SOLO), 2) AS MEDIA_UMIDADE,
  MAX(UMIDADE_SOLO) AS MAX_UMIDADE,
  MIN(UMIDADE_SOLO) AS MIN_UMIDADE
FROM SENSORES_FARMTECH;



-- ===========================================================
-- Fim do arquivo consultas.sql
-- ===========================================================