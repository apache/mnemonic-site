from typing import Optional
from fastapi import FASTAPI

app = FastAPI()

@app.get("/")
def mnemonic_home():
    return {"Apache Mnemonic Home"}
