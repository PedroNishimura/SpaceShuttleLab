CREATE SCHEMA IF NOT EXISTS spacedb;

CREATE TABLE spacedb.posicao (
    id SERIAL PRIMARY KEY,
    hora_info TEXT,
    letreiro_completo TEXT,
    cd_linha INTEGER,
    sentido SMALLINT,
    letreiro_destino TEXT,
    letreiro_origem TEXT,
    quantidade_veiculos INTEGER,
    prefixo TEXT,
    flag_acessivel BOOLEAN,
    data_hora TIMESTAMP,
    latitude_veiculo TEXT,
    longitude_veiculo TEXT
);
