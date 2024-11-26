# %%
import requests
import pandas as pd
# %%
input_data = {"inputs": [
    [14.23, 1.71, 2.43, 15.6, 127.0, 2.8, 3.06, 0.28, 2.29, 5.64, 1.04, 3.92, 1065.0],
    [14.23, 1.71, 2.43, 15.6, 127.0, 2.8, 3.06, 0.28, 2.29, 5.64, 1.04, 3.92, 1065.0]
]}
input_data
# %%
port = 8080
predictons = requests.post(
    f'http://127.0.0.1:{port}/invocations',
    json=input_data
)
# %%
predictons.json()
# %%
