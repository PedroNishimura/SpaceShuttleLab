# SpaceShuttleLab
Data Pipeline for SPTrans

![alt text](SpaceShuttle.jpg)


URLS:
PostgreSQL = http://localhost:5433/browser/
MINIO = http://localhost:9051/browser
JUPYTER = http://localhost:8889/lab?


Notebook de escrita no minio: http://localhost:8889/lab/tree/collect_to_raw.ipynb
Notebook de escrita no postgres(temporario): http://localhost:8889/lab/tree/temporary_write_postgresql.ipynb

se não funcionar a escrita no minio, tenta criar a accesskey como "datalake" direto no link do minio em "Access Keys"

verifique a configuração do postgres:
1 - abra o arquivo docker-compose para pegar as credenciais
      PGADMIN_DEFAULT_EMAIL
      PGADMIN_DEFAULT_PASSWORD

2 - faça o login e se não houver nenhum server dentro de servers siga os passos abaixo
    clique com o botão direito em servers
    depois clique em register
    depois clique em server...

    configure igual as imagens que to mandando no app.


Com todos os componentes rodando você já consegue executar os notebooks.
    