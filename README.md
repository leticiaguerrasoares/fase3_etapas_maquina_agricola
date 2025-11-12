# Fase 3 — Banco de Dados Oracle (FarmTech Solutions)

## Contexto e Objetivo
Nesta etapa do projeto **FarmTech Solutions**, o foco foi trabalhar com um **banco de dados Oracle** para armazenar e analisar as informações coletadas pelos sensores agrícolas.  
O trabalho teve como objetivos principais:

1. **Estruturar** uma tabela relacional no Oracle para organizar as leituras dos sensores;  
2. **Importar** o arquivo de dados gerado na Fase 2 (arquivo CSV com as medições simuladas);  
3. **Executar consultas SQL** demonstrando seleção, filtragem, ordenação e funções estatísticas básicas (AVG, MAX, MIN);  
4. **Documentar** todas as etapas, incluindo prints do processo e resultados obtidos.

Essas ações permitiram compreender melhor os dados capturados e preparar a base para futuras análises com foco em automação e inteligência artificial no agronegócio.

## Equipe 
- João Rafael Gonçalves Ramos  
- Letícia Angelim Guerra  
- Matheus Guimarães França  
- Rivando Bezerra Cavalcanti Neto  
- Tales Ferraz de Arruda Domienikan  

## Conjunto de Dados
Arquivo: `data/dados_sensores.csv`  
Período coberto: **06/11/2025 08:00 → 06/11/2025 11:55**  
Intervalo entre leituras: **5 minutos**  
Duração total da simulação: **4 horas**  
Total de leituras: **48**

Variáveis principais (amostra):
- `created_at` (timestamp da leitura)  
- `ph_solo`, `umidade_solo`, `temperatura`, `sensacao_termica`, `umidade_ar`  
- `nitrogenio`, `fosforo`, `potassio`  
- `status_bomba` (indicador 0/1)

## Esquema Relacional
Foi criada no Oracle uma tabela chamada `SENSORES_FARMTECH` com os seguintes campos:

```sql
CREATE TABLE SENSORES_FARMTECH (
  CREATED_AT        TIMESTAMP,
  PH_SOLO           NUMBER(4,2),
  UMIDADE_SOLO      NUMBER(5,1),
  NITROGENIO        NUMBER(5,0),
  FOSFORO           NUMBER(5,0),
  POTASSIO          NUMBER(5,0),
  STATUS_BOMBA      NUMBER(1,0),
  TEMPERATURA       NUMBER(4,1),
  SENSACAO_TERMICA  NUMBER(4,1),
  UMIDADE_AR        NUMBER(4,1)
);
```

## Etapas Realizadas
1. Criação da tabela `SENSORES_FARMTECH` no Oracle SQL Developer.  
2. Importação do arquivo CSV com o assistente Import Data.  
3. Execução das consultas SQL listadas a seguir para análise dos dados.  
4. Registro dos prints de tela das etapas no diretório /docs.

> Todos os prints do processo (importação, consultas e resultados) estão salvos na pasta docs.

## Consultas SQL Executadas
### 🔹 Consulta 1 — Verificação de importação:
```sql
SELECT * FROM SENSORES_FARMTECH
FETCH FIRST 20 ROWS ONLY;
```

### 🔹 Consulta 2 — Filtragem por umidade >70:
```sql
SELECT *
FROM SENSORES_FARMTECH
WHERE UMIDADE_SOLO > 70
ORDER BY CREATED_AT;
```
### 🔹 Consulta 3 — Ordenação (top 10 maiores valores de pH):
```sql
SELECT *
FROM SENSORES_FARMTECH
ORDER BY PH_SOLO DESC
FETCH FIRST 10 ROWS ONLY;
```
### 🔹 Consulta 4 — Cálculo de médias e extremos:
```sql
SELECT
  ROUND(AVG(UMIDADE_SOLO),2) AS MEDIA_UMIDADE_SOLO,
  ROUND(AVG(TEMPERATURA),2)  AS MEDIA_TEMPERATURA,
  ROUND(AVG(UMIDADE_AR),2)   AS MEDIA_UMIDADE_AR,
  MIN(PH_SOLO)               AS PH_MIN,
  MAX(PH_SOLO)               AS PH_MAX
FROM SENSORES_FARMTECH;
```

## Resultados Obtidos
- **pH (mín–máx)**: **6.35 – 6.85**  
- **Médias gerais**:
  - Umidade do solo: **58.92%**  
  - Temperatura: **25.04 °C**  
  - Umidade do ar: **60.29%**  

Esses resultados ajudam a entender o comportamento das variáveis ambientais durante a simulação e servem de base para futuras análises sobre irrigação e controle automático do solo.


## Evidências (prints)
- `docs/print_select.png` — Resultado do comando **SELECT***
- `docs/print_where.png` — Consulta com filtro (**WHERE**)
- `docs/print_orderby.png` — Ordenação com  (**ORDER BY**)  
- `docs/print_stats.png` — Estatísticas (**AVG / MAX / MIN**)

## Vídeo de Apresentação
O vídeo !LINK! mostra a estrutura do repositório, o processo de importação no Oracle e as consultas sendo executadas.
********📎 Link: ADDICIONAR LINK*****************************************************

## Estrutura do Projeto
```
/
 ┣ data/  → dados_sensores.csv
 ┣ docs/  → prints do SQL Developer
 ┣ src/   → consultas.sql (DDL + consultas)
 └ README.md
```

