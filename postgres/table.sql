CREATE TABLE spacedb.public.Stop (
    cp INT PRIMARY KEY,                 -- Código identificador da parada (chave primária)
    np VARCHAR(255) NOT NULL,           -- Nome da parada
    ed VARCHAR(255) NOT NULL,           -- Endereço de localização da parada
    py NUMERIC NOT NULL,       -- Informação de latitude da localização da parada
    px NUMERIC NOT NULL,       -- Informação de longitude da localização da parada
    cl INT                              -- Código da Linha
);

CREATE TABLE spacedb.public.Position (
    hr VARCHAR(50) NOT NULL,    -- Horário de referência da geração das informações
    p INT NOT NULL,             -- Prefixo do veículo
    a BOOLEAN NOT NULL,         -- Indica se o veículo é acessível para pessoas com deficiência
    ta VARCHAR(50) NOT NULL,    -- Horário universal (UTC) em que a localização foi capturada (ISO 8601)
    py NUMERIC(9,6) NOT NULL,   -- Informação de latitude da localização do veículo (ajustado para precisão)
    px NUMERIC(9,6) NOT NULL,   -- Informação de longitude da localização do veículo (ajustado para precisão)
    cl INT,                     -- Código Linha
    PRIMARY KEY (p, ta)         -- Chave primária composta por prefixo do veículo e horário de captura
);

CREATE TABLE spacedb.public.Forecast (
    p INT NOT NULL,             -- Prefixo do veículo
    t VARCHAR(50) NOT NULL,     -- Horário previsto para chegada do veículo no ponto de parada
    a BOOLEAN NOT NULL,         -- Indica se o veículo é acessível para pessoas com deficiência
    ta VARCHAR(50) NOT NULL,    -- Horário universal (UTC) da captura da localização do veículo (ISO 8601)
    veiculo_py NUMERIC(9,6) NOT NULL, -- Informação de latitude da localização do veículo
    veiculo_px NUMERIC(9,6) NOT NULL, -- Informação de longitude da localização do veículo
    cl INT,                     -- Código Linha
    PRIMARY KEY (p, ta)         -- Chave primária composta por prefixo do veículo e horário de captura
);