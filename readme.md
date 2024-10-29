
# Instalation
```bash
conda create -n mlflow-deployment python=3.12
conda activate mlflow-deployment
pip install "mlflow[mlserver]"
pip install google-cloud-storage
```

# Env Vars
GOOGLE_APPLICATION_CREDENTIALS=/code/credentials.json
MLFLOW_TRACKING_USERNAME=usuario
MLFLOW_TRACKING_PASSWORD=password
MLFLOW_TRACKING_URI=http://127.0.0.1:5000


# Servir modelo
```bash
mlflow models serve -m runs:/bd66b2d80c1a47e89a6be7d17104a8a7/model -p 1234 --enable-mlserver --no-conda
```


https://mlflow.org/docs/latest/deployment/deploy-model-locally.html#serving-frameworks

```bash
mlflow models serve -m runs:/bd66b2d80c1a47e89a6be7d17104a8a7/model -p 1234 --no-conda
```

 ```bash
 curl -X POST -H "Content-Type:application/json" --data '{"inputs": [[14.23, 1.71, 2.43, 15.6, 127.0, 2.8, 3.06, 0.28, 2.29, 5.64, 1.04, 3.92, 1065.0]]}' http://127.0.0.1:1234/invocations
 ```


```bash
mlflow models build-docker -m runs:/bd66b2d80c1a47e89a6be7d17104a8a7/model -n <your_dockerhub_user_name>/mlflow-wine-classifier --enable-mlserver

mlflow models build-docker -m runs:/bd66b2d80c1a47e89a6be7d17104a8a7/model -n mlflow-wine-classifier --enable-mlserver
```

```bash
 docker run mlflow-wine-classifier -p 8080:8080
```

 # Deploy to kubernets
 `gs://infoxel-ml-ops/mlflow_repository/180333391132533584/123813544bb94f3082e421c83ba7def8/artifacts/model`


# References
https://mlflow.org/docs/latest/deployment/index.html

https://mlflow.org/docs/latest/deployment/deploy-model-to-kubernetes/index.html

https://mlflow.org/docs/latest/deployment/deploy-model-to-kubernetes/tutorial.html
