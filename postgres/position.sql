CREATE SCHEMA IF NOT EXISTS spacedb;

CREATE TABLE spacedb.position (
    id SERIAL PRIMARY KEY,
    hora TEXT,
    codigo_empresa TEXT,
    codigo_linha INTEGER,
    sentido_operacao SMALLINT,
    destino_linha TEXT,
    origem_linha TEXT,
    veiculos_circulacao INTEGER,
    prefixo_veiculo TEXT,
    flag_acessivel BOOLEAN,
    data_hora TIMESTAMP,
    latitude TEXT,
    longitude TEXT
);

CREATE TABLE spacedb.preview (
    id SERIAL PRIMARY KEY,
    hora TEXT,
    codigo_parada TEXT,
    nome_parada TEXT,
    latitude_parada TEXT,
    longitude_parada TEXT,
    prefixo_veiculo TEXT,
    previsao_chegada_parada TEXT,
    flag_acessivel BOOLEAN,
    data_hora TIMESTAMP,
    latitude_veiculo TEXT,
    longitude_veiculo TEXT
);