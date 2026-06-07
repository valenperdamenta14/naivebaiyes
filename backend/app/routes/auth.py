from fastapi import APIRouter
from fastapi import Depends
from fastapi import HTTPException

from sqlalchemy.orm import Session

from app.database import get_db

from app.models.user import User

from app.schemas.auth_schema import LoginSchema

from app.utils.security import verify_password
from app.utils.security import create_access_token

router = APIRouter(
    prefix="/auth",
    tags=["Authentication"]
)


@router.post("/login")
def login(
    request: LoginSchema,
    db: Session = Depends(get_db)
):

    user = db.query(User).filter(
        User.username == request.username
    ).first()

    if not user:
        raise HTTPException(
            status_code=401,
            detail="Username tidak ditemukan"
        )

    if not verify_password(
        request.password,
        user.password
    ):
        raise HTTPException(
            status_code=401,
            detail="Password salah"
        )

    token = create_access_token(
        {
            "id": user.id,
            "role": user.role
        }
    )

    return {
        "token": token,
        "role": user.role
    }