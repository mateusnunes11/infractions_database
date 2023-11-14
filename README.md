infractions_database

Este é um sistema de gerenciamento de infrações de trânsito, acompanhado de um modelo físico de banco de dados e consultas SQL para atender a requisitos específicos. A seguir estão detalhes sobre os arquivos e como utilizar o sistema.

Arquivos:
infractions_database.sql: Este arquivo contém o script para criar o modelo físico do banco de dados. Certifique-se de executar este script em seu sistema de gerenciamento de banco de dados para criar as tabelas necessárias.

queries.sql: Aqui, você encontrará as consultas SQL para atender aos seguintes requisitos:

Consulta para criar um relatório de infrações com velocidade medida igual ou acima de 20% da velocidade permitida, ordenado por data e hora.
Consulta para cada remessa, apresentando sua identificação, situação, total de infrações, total de infrações válidas e total de infrações inválidas, ordenado pela situação das remessas.
Instruções de Uso:
Executando o Script de Criação do Banco de Dados:

Abra seu sistema de gerenciamento de banco de dados.
Execute o script contido no arquivo infractions_database.sql para criar as tabelas necessárias.
Executando Consultas SQL:

Após criar o banco de dados, você pode executar as consultas contidas no arquivo queries.sql para obter relatórios específicos.
Certifique-se de ajustar as consultas conforme necessário, dependendo do sistema de gerenciamento de banco de dados que você está usando.
Adaptações:

Caso seu sistema de gerenciamento de banco de dados não suporte o tipo de dados BOOLEAN, consulte o README para obter instruções sobre como adaptar as tabelas e consultas.
Requisitos:
Sistema de Gerenciamento de Banco de Dados compatível (MySQL, PostgreSQL, SQLite, etc.).
