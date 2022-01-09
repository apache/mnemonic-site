from typing import Optional
from fastapi import FASTAPI

app = FastAPI()

@app.get("/")
def mnemonic_home():
    return {"Apache Mnemonic Home"}

@app.get("/docs")
def mnemonic_docs():
    return {"Mnemonic documentation home page"}

@app.get("/downloads")
def mnemonic_downloads():
    return {"Mnemonic downloads home page"}

@app.get("/talks")
def mnemonic_talks():
    return {"Mnemonic talks home page"}

@app.get("/news")
def mnemonic_news():
    return {"Mnemonic news home page"}

@app.get("/develop")
def mnemonic_develop():
    return {"Mnemonic development home page"}

@app.get("/help")
def mnemonic_help():
    return {"Mnemonic help home page"}
