from fastapi import APIRouter
from fastapi import Depends

from sqlalchemy.orm import Session

from app.database import get_db

from app.models.siswa import Siswa
from app.models.jawaban_kuesioner import JawabanKuesioner
from app.models.hasil_klasifikasi import HasilKlasifikasi

router = APIRouter(
    prefix="/dashboard",
    tags=["Dashboard"]
)


@router.get("/summary")
def dashboard_summary(
    db: Session = Depends(get_db)
):

    total_siswa = db.query(
        Siswa
    ).count()

    pending = db.query(
        JawabanKuesioner
    ).filter(
        JawabanKuesioner.status == "pending"
    ).count()

    processed = db.query(
        HasilKlasifikasi
    ).count()

    return {
        "total_siswa": total_siswa,
        "pending": pending,
        "processed": processed
    }