from fastapi import APIRouter
from fastapi import UploadFile
from fastapi import File
from fastapi import Depends
from fastapi import HTTPException

from sqlalchemy.orm import Session

from app.database import get_db

from app.models.dataset_training import DatasetTraining
from app.models.dataset_status import DatasetStatus

import pandas as pd

router = APIRouter(
    prefix="/dataset",
    tags=["Dataset Training"]
)


@router.post("/import")
async def import_dataset(
    file: UploadFile = File(...),
    db: Session = Depends(get_db)
):

    if not file.filename.endswith(
        (".xlsx", ".xls")
    ):
        raise HTTPException(
            status_code=400,
            detail="File harus berupa Excel"
        )

    df = pd.read_excel(file.file)

    if len(df) == 0:
        raise HTTPException(
            status_code=400,
            detail="Dataset kosong"
        )

    # hapus dataset lama
    db.query(
        DatasetTraining
    ).delete()

    total = 0

    for _, row in df.iterrows():

        data = DatasetTraining(
            kategori_motivasi=str(
                row["Kategori Motivasi"]
            ).strip(),

            kategori_kehadiran=str(
                row["Kategori Kehadiran"]
            ).strip(),

            kategori_prestasi=str(
                row["Kategori Prestasi"]
            ).strip()
        )

        db.add(data)

        total += 1

    status = db.query(
        DatasetStatus
    ).first()

    if not status:
        status = DatasetStatus()

        db.add(status)

    status.status = "aktif"
    status.nama_file = file.filename
    status.jumlah_data = total

    db.commit()

    return {
        "message": f"{total} data training berhasil diimport"
    }


@router.get("/")
def get_dataset(
    db: Session = Depends(get_db)
):
    return db.query(
        DatasetTraining
    ).all()


@router.get("/status")
def get_status(
    db: Session = Depends(get_db)
):

    status = db.query(
        DatasetStatus
    ).first()

    if not status:
        return {
            "status": "nonaktif",
            "nama_file": None,
            "jumlah_data": 0
        }

    return {
        "status": status.status,
        "nama_file": status.nama_file,
        "jumlah_data": status.jumlah_data
    }

@router.post("/deactivate")
def deactivate_dataset(
    db: Session = Depends(get_db)
):

    status = db.query(
        DatasetStatus
    ).first()

    if status:
        status.status = "nonaktif"

    db.commit()

    return {
        "message": "Dataset dinonaktifkan"
    }