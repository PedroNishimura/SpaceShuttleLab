import os
import json
import io
import requests
from minio import Minio
from minio.error import S3Error # type: ignore
from datetime import datetime

def authToken(session) -> int:
    res = session.post(os.getenv('URL_AUTH_TOKEN'))
    
    return res.status_code


def fetchData(url: str, arrLines: list) -> list:
    session = requests.Session()

    authRes = authToken(session)

    arrObjects = []

    if (authRes == 200):
        for line in arrLines:
            res = session.get(f'{url}={line}')

            res = res.json()

            if (not isinstance(res, dict)):
                obj = {}
                obj['lista'] = res
                res = obj

            res['linha'] = line

            arrObjects.append(res)

    return arrObjects
    
def insertData(arrObjects: list, path: str):
    dateNow = datetime.now().strftime("%d%m%Y%H%M%S")
    bucket = 'raw'

    client = Minio(
        'host.docker.internal:9050',
        access_key=os.getenv('MINIO_ACESS_KEY'),
        secret_key=os.getenv('MINIO_SECRET_KEY'),
        secure=False
    )
    
    for obj in arrObjects:
        json_data = json.dumps(obj)
        json_bytes = io.BytesIO(json_data.encode('utf-8'))

        try:
            object_name = f"{path}/{obj['linha']}_{dateNow}.json"

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
