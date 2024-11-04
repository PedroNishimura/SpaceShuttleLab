import os
import json
import io
import requests
from minio import Minio
from minio.error import S3Error # type: ignore
from datetime import datetime

ARR_LINES = [1726, 2607, 34494, 35375]

def authToken(session) -> int:
    url = 'http://api.olhovivo.sptrans.com.br/v2.1/Login/Autenticar'
    token = {'token': "4878e23ec08fc0d75b1f6c39301e58c8c3a741b5f21dd1221ebacf87225e1cf5"}
    res = session.post(url, params=token)
    
    return res.status_code


def fetchData(url: str) -> list:
    session = requests.Session()

    authRes = authToken(session)
    arrObjects = []

    if len(arrLines) == 0:
        res = session.get(f'{url}')
        res = res.json()
        arrObjects.append(res)
        return arrObjects

    if (authRes == 200):
        for line in ARR_LINES:
            res = session.get(f'{url}={line}')

            res = res.json()
            arrObjects.append(res)

    return arrObjects
    
def insertData(arrObjects: list, path: str, bucket_name:str):
    dateNow = datetime.now().strftime("%d%m%Y%H%M%S")
    bucket = 'raw'

    client = Minio(
        'host.docker.internal:9050',
        access_key='spaceshuttle',
        secret_key='spaceshuttle',
        secure=False
    )

    for obj in arrObjects:
        json_data = json.dumps(obj)
        json_bytes = io.BytesIO(json_data.encode('utf-8'))

        try:
            object_name = f"{path}/{bucket_name}_{dateNow}.json"

            client.put_object(
                bucket, 
                object_name, 
                data=json_bytes, 
                length=len(json_data), 
                content_type='application/json'
            )

            client.stat_object(bucket, object_name)

            print(f"Objeto '{object_name}' enviado com sucesso!")
        except S3Error as e:
            return print(e)