from fastapi import APIRouter
from fastapi import UploadFile
from fastapi import File
from fastapi import Depends

from sqlalchemy.orm import Session

from app.database import get_db

from app.models.dataset_training import DatasetTraining

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

    df = pd.read_excel(file.file)

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

    db.commit()

    return {
        "message": f"{total} data training berhasil diimport"
    }

@router.get("/")
def get_dataset(
    db: Session = Depends(get_db)
):
    data = db.query(
        DatasetTraining
    ).all()

    return data