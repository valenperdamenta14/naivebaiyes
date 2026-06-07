from fastapi import APIRouter
from fastapi import UploadFile
from fastapi import File
from fastapi import Depends

from sqlalchemy.orm import Session

from app.database import get_db

from app.models.siswa import Siswa
from app.models.user import User

from app.utils.security import hash_password

import pandas as pd

router = APIRouter(
    prefix="/siswa",
    tags=["Siswa"]
)


@router.post("/import")
async def import_siswa(
    file: UploadFile = File(...),
    db: Session = Depends(get_db)
):

    df = pd.read_excel(file.file)

    total = 0

    for _, row in df.iterrows():

        nis = str(row["NIS"])
        nisn = str(row["NISN"])

        cek = db.query(Siswa).filter(
            Siswa.nisn == nisn
        ).first()

        if cek:
            continue

        kehadiran = float(row["Kehadiran (%)"])

        if kehadiran >= 90:
            kategori_kehadiran = "Baik"
        elif kehadiran >= 75:
            kategori_kehadiran = "Cukup"
        else:
            kategori_kehadiran = "Kurang"

        siswa = Siswa(
            nis=nis,
            nisn=nisn,
            nama=row["Nama"],
            kelas=row["Kelas"],
            jk=row["JK"],
            kehadiran=kehadiran,
            kategori_kehadiran=kategori_kehadiran
        )

        db.add(siswa)
        db.flush()

        cek_user = db.query(User).filter(
            User.username == nisn
        ).first()

        if not cek_user:
            user = User(
                username=nisn,
                password=hash_password(nisn),
                role="siswa"
            )

            db.add(user)

        total += 1

    db.commit()

    return {
        "message": f"{total} siswa berhasil diimport"
    }


@router.get("/")
def get_siswa(
    db: Session = Depends(get_db)
):
    return db.query(Siswa).all()