# Space Shuttle

> Este repositório possui um pipeline para o consumo de dados da API Olho Vivo da SP Trans. Foram utilizadas as tecnologias do Apache Airflow, MinIO, Spark, Jupyter Notebook e Docker.


# Acesso ao Projeto
> Para acessar ao projeto, faça o login utilizando sua conta github: https://github.com/  
> Acesse ao projeto utilizando a url: https://github.com/PedroNishimura/SpaceShuttleLab


# Solução Proposta
> Considerando o fluxo contínuo de dados para um fornecimento NRT (near-real-time), optamos por iniciar o fluxo de ingestão utilizando o Apache Airflow, a qual, funcionando como um orquestrador que efetuando execuções de requisições HTTP para as APIs do Olho Vivo, irá capturar e inserir os dados em formato Json no bucket Raw do Minio. A escolha se deu pela capacidade de agendamento de tarefas.   

> O fluxo de tratamento dos dados e inserção nas camadas Trusted e na tabela do PostgreSQL, foi definido em ser utilizado o spark em execuções dentro do Jupyter notebook. Sendo possível a execução dos Scripts e realizar as transformações necessárias utilizando o Spark.  

> Para a visualização dos dados, optamos no uso do PowerBI a qual nos oferece uma variedade de apresentação dos dados e facilidade na integração com o PostgreSQL.