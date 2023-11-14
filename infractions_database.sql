-- Verificar se a tabela Remessa já existe antes de criar
IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Remessa')
BEGIN
    -- Tabela de Remessa
    CREATE TABLE Remessa
    (
        idRemessa INT PRIMARY KEY,
        totalInfractions INT,
        situacao VARCHAR(20) CHECK (situacao IN ('Criada', 'Expedida', 'Aceita', 'Não Aceita'))
    );
END;

-- Verificar se a tabela Infracao já existe antes de criar
IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Infracao')
BEGIN
    -- Tabela de Infração
    CREATE TABLE Infracao
    (
        idInfracao INT PRIMARY KEY,
        numero INT,
        dataHora DATETIME,
        equipamento VARCHAR(50),
        velocidadePermitida INT,
        velocidadeMedida INT,
        isValid BIT,
        idRemessa INT,
        FOREIGN KEY (idRemessa) REFERENCES Remessa(idRemessa)
    );
END;

-- Consulta para relatório de infrações com velocidade medida igual ou acima de 20% da velocidade permitida
SELECT *
FROM Infracao
WHERE (velocidadeMedida / velocidadePermitida) >= 1.2
ORDER BY dataHora;

-- Consulta para cada remessa com identificação, situação, total de infrações, total de infrações válidas e total de infrações inválidas
SELECT
    R.idRemessa,
    R.situacao,
    R.totalInfractions AS 'Total de Infrações',
    COUNT(I.idInfracao) AS 'Total de Infrações Válidas',
    (R.totalInfractions - COUNT(I.idInfracao)) AS 'Total de Infrações Inválidas'
FROM Remessa R
    JOIN Infracao I ON R.idRemessa = I.idRemessa
GROUP BY R.idRemessa, R.situacao, R.totalInfractions
ORDER BY R.situacao;
