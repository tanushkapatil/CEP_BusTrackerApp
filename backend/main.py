from fastapi import FastAPI
from app.routes import auth

app = FastAPI(title="Transport Management API")

# Include all API routes
app.include_router(auth.router)

@app.get("/")
def home():
    return {"message": "Backend is running!"}
