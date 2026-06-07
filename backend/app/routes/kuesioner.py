from fastapi import APIRouter
from fastapi import Depends

from sqlalchemy.orm import Session

from app.database import get_db

from app.schemas.kuesioner_schema import KuesionerSchema

from app.models.jawaban_kuesioner import JawabanKuesioner
from app.models.siswa import Siswa

router = APIRouter(
    prefix="/kuesioner",
    tags=["Kuesioner"]
)


@router.post("/submit")
def submit_kuesioner(
    request: KuesionerSchema,
    db: Session = Depends(get_db)
):

    siswa = db.query(Siswa).filter(
        Siswa.id == request.siswa_id
    ).first()

    if not siswa:
        return {
            "message": "Siswa tidak ditemukan"
        }

    cek_kuesioner = db.query(
        JawabanKuesioner
    ).filter(
        JawabanKuesioner.siswa_id == request.siswa_id
    ).first()

    if cek_kuesioner:
        return {
            "message": "Kuesioner sudah pernah diisi"
        }

    total_intrinsik = (
        request.q1 +
        request.q2 +
        request.q3 +
        request.q4 +
        request.q5 +
        request.q6 +
        request.q7 +
        request.q8 +
        request.q9 +
        request.q10
    )

    total_ekstrinsik = (
        request.q11 +
        request.q12 +
        request.q13 +
        request.q14 +
        request.q15 +
        request.q16 +
        request.q17 +
        request.q18 +
        request.q19 +
        request.q20
    )

    total_score = (
        total_intrinsik +
        total_ekstrinsik
    )

    if 20 <= total_score <= 60:
        kategori_motivasi = "Rendah"
    else:
        kategori_motivasi = "Sedang"

    data = JawabanKuesioner(
        siswa_id=request.siswa_id,

        q1=request.q1,
        q2=request.q2,
        q3=request.q3,
        q4=request.q4,
        q5=request.q5,

        q6=request.q6,
        q7=request.q7,
        q8=request.q8,
        q9=request.q9,
        q10=request.q10,

        q11=request.q11,
        q12=request.q12,
        q13=request.q13,
        q14=request.q14,
        q15=request.q15,

        q16=request.q16,
        q17=request.q17,
        q18=request.q18,
        q19=request.q19,
        q20=request.q20,

        total_intrinsik=total_intrinsik,
        total_ekstrinsik=total_ekstrinsik,
        total_score=total_score,

        kategori_motivasi=kategori_motivasi,

        status="pending"
    )

    db.add(data)
    db.commit()

    return {
        "message": "Kuesioner berhasil disimpan",
        "total_intrinsik": total_intrinsik,
        "total_ekstrinsik": total_ekstrinsik,
        "total_score": total_score,
        "kategori_motivasi": kategori_motivasi
    }


@router.get("/pending")
def get_pending(
    db: Session = Depends(get_db)
):
    return db.query(
        JawabanKuesioner
    ).filter(
        JawabanKuesioner.status == "pending"
    ).all()


@router.get("/processed")
def get_processed(
    db: Session = Depends(get_db)
):
    return db.query(
        JawabanKuesioner
    ).filter(
        JawabanKuesioner.status == "processed"
    ).all()