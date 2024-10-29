from airflow import DAG # type: ignore
from airflow.utils.dates import days_ago # type: ignore
from airflow.operators.python import PythonOperator # type: ignore
from utils.util import fetchData, insertData

default_args = {
    'owner': 'spaceshuttle',
    'depends_on_past': False,
    'start_date': days_ago(1),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
}

def extract():
    url = 'http://api.olhovivo.sptrans.com.br/v2.1/Parada/BuscarParadasPorLinha?codigoLinha'
    arrLines = [1726, 2607, 34494, 35375]

    return fetchData(url, arrLines)

def insert(ti):
    arrObjects = ti.xcom_pull(task_ids='extract')

    return insertData(arrObjects, '/stop',)

with DAG(
    'getDataStop',
    default_args=default_args,
    description='DAG to extract and insert stop data into minio',
    schedule_interval='@daily'
) as dag:
    extract_task = PythonOperator(
        task_id='extract',
        python_callable=extract
    )

    insert_task = PythonOperator(
        task_id='insert',
        python_callable=insert
    )

extract_task >> insert_task