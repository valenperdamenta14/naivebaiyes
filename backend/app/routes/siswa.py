from fastapi import APIRouter
from fastapi import UploadFile
from fastapi import File
from fastapi import Depends
from fastapi import HTTPException
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


@router.get("/")
def get_siswa(
    db: Session = Depends(get_db)
):
    return db.query(Siswa).all()


@router.post("/")
def tambah_siswa(
    data: dict,
    db: Session = Depends(get_db)
):

    cek = db.query(Siswa).filter(
        Siswa.nisn == data["nisn"]
    ).first()

    if cek:
        raise HTTPException(
            status_code=400,
            detail="NISN sudah terdaftar"
        )

    kehadiran = float(data["kehadiran"])

    if kehadiran >= 90:
        kategori_kehadiran = "Baik"
    elif kehadiran >= 75:
        kategori_kehadiran = "Cukup"
    else:
        kategori_kehadiran = "Kurang"

    siswa = Siswa(
        nis=data["nis"],
        nisn=data["nisn"],
        nama=data["nama"],
        kelas=data["kelas"],
        jk=data["jk"],
        kehadiran=kehadiran,
        kategori_kehadiran=kategori_kehadiran
    )

    db.add(siswa)
    db.flush()

    user = User(
        username=data["nisn"],
        password=hash_password(data["123456"]),
        role="siswa",
        siswa_id=siswa.id
    )

    db.add(user)

    db.commit()

    return {
        "message": "Siswa berhasil ditambahkan"
    }


@router.put("/{id}")
def edit_siswa(
    id: int,
    data: dict,
    db: Session = Depends(get_db)
):

    siswa = db.query(Siswa).filter(
        Siswa.id == id
    ).first()

    if not siswa:
        raise HTTPException(
            status_code=404,
            detail="Siswa tidak ditemukan"
        )

    kehadiran = float(data["kehadiran"])

    if kehadiran >= 90:
        kategori_kehadiran = "Baik"
    elif kehadiran >= 75:
        kategori_kehadiran = "Cukup"
    else:
        kategori_kehadiran = "Kurang"

    siswa.nis = data["nis"]
    siswa.nisn = data["nisn"]
    siswa.nama = data["nama"]
    siswa.kelas = data["kelas"]
    siswa.jk = data["jk"]
    siswa.kehadiran = kehadiran
    siswa.kategori_kehadiran = kategori_kehadiran

    user = db.query(User).filter(
        User.siswa_id == siswa.id
    ).first()

    if user:
        user.username = data["nisn"]

    db.commit()

    return {
        "message": "Data siswa berhasil diperbarui"
    }


@router.delete("/{id}")
def hapus_siswa(
    id: int,
    db: Session = Depends(get_db)
):

    siswa = db.query(Siswa).filter(
        Siswa.id == id
    ).first()

    if not siswa:
        raise HTTPException(
            status_code=404,
            detail="Siswa tidak ditemukan"
        )

    user = db.query(User).filter(
        User.siswa_id == siswa.id
    ).first()

    if user:
        db.delete(user)
        db.flush()

    db.delete(siswa)

    db.commit()

    return {
        "message": "Siswa berhasil dihapus"
    }


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

        kehadiran = float(
            row["Kehadiran (%)"]
        )

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

        user = User(
            username=nisn,
            password=hash_password("123456"),
            role="siswa",
            siswa_id=siswa.id
        )

        db.add(user)

        total += 1

    db.commit()

    return {
        "message": f"{total} siswa berhasil diimport"
    }