import requests
from fastapi import APIRouter, HTTPException, Depends
from pydantic import BaseModel
from firebase_admin import auth  # Import Firebase Admin SDK (needed for getting user details)
#import firebase  # This ensures Firebase is initialized

router = APIRouter(prefix="/auth", tags=["Authentication"])

FIREBASE_API_KEY = "AIzaSyC1sypOHIymrG1OIbuRb44aCa93nJTPD8o"
FIREBASE_AUTH_URL = f"https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key={FIREBASE_API_KEY}"

class LoginRequest(BaseModel):
    email: str
    password: str

@router.post("/login")
def login(request: LoginRequest):
    """Authenticate driver using Firebase"""
    data = {
        "email": request.email,
        "password": request.password,
        "returnSecureToken": True
    }
    response = requests.post(FIREBASE_AUTH_URL, json=data)
    
    if response.status_code == 200:
        user_data = response.json()
        return {"user_id": user_data["localId"], "token": user_data["idToken"]}
    
    raise HTTPException(status_code=401, detail="Invalid email or password")
