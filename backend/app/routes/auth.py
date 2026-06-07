from fastapi import APIRouter
from fastapi import Depends
from fastapi import HTTPException

from sqlalchemy.orm import Session

from app.database import get_db

from app.models.user import User
from app.models.siswa import Siswa

from app.schemas.auth_schema import LoginSchema
from app.schemas.auth_schema import LoginSiswaSchema

from app.utils.security import verify_password
from app.utils.security import create_access_token

from app.utils.auth import get_current_user

router = APIRouter(
    prefix="/auth",
    tags=["Authentication"]
)


# ==========================
# LOGIN GURU / ADMIN
# ==========================
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


# ==========================
# LOGIN SISWA (NISN SAJA)
# ==========================
@router.post("/login-siswa")
def login_siswa(
    request: LoginSiswaSchema,
    db: Session = Depends(get_db)
):

    user = db.query(User).filter(
        User.username == request.nisn,
        User.role == "siswa"
    ).first()

    if not user:
        raise HTTPException(
            status_code=404,
            detail="NISN tidak ditemukan"
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


# ==========================
# CURRENT USER
# ==========================
@router.get("/me")
def me(
    current_user=Depends(get_current_user),
    db: Session = Depends(get_db)
):

    data = {
        "id": current_user.id,
        "username": current_user.username,
        "role": current_user.role,
        "siswa_id": current_user.siswa_id
    }

    if current_user.siswa_id:

        siswa = db.query(Siswa).filter(
            Siswa.id == current_user.siswa_id
        ).first()

        if siswa:
            data["nama"] = siswa.nama
            data["kelas"] = siswa.kelas
            data["nisn"] = siswa.nisn
            data["kehadiran"] = float(siswa.kehadiran)
            data["kategori_kehadiran"] = siswa.kategori_kehadiran

    return data