from urllib import response
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

#from .library.helpers import *

app = FastAPI()

templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    data = {
        "page": "Home page"
    }
    return templates.TemplateResponse("page.html", {"request": request, "data": data})

@app.get("/page/{page_name}", response_class=HTMLResponse)
async def page(request: Request, page_name: str):
    data = {
        "page": page_name
    }
    return templates.TemplateResponse("page.html", {"request": request, "data": data})

@app.get("/docs", response_class=HTMLResponse)
async def mnemonic_docs(request: Request):
    data = {
        "page": "docs"
    }
    return templates.TemplateResponse("page.html", {"request": request, "data": data})

if __name__ == "__main__":
    from uvicorn import Config, Server
    server = Server(
        Config(
            app,
            host="0.0.0.0",
            port=443,
        )
    )
    server.run()