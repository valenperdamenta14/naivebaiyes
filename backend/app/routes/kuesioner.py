from fastapi import APIRouter
from fastapi import Depends
from fastapi import UploadFile
from fastapi import File

from sqlalchemy.orm import Session

from app.database import get_db

from app.schemas.kuesioner_schema import KuesionerSchema

from app.models.jawaban_kuesioner import JawabanKuesioner
from app.models.siswa import Siswa
from app.models.dataset_training import DatasetTraining
from app.models.dataset_status import DatasetStatus

import pandas as pd

router = APIRouter(
    prefix="/kuesioner",
    tags=["Kuesioner"]
)


@router.post("/upload-dataset")
async def upload_dataset(
    file: UploadFile = File(...),
    db: Session = Depends(get_db)
):

    df = pd.read_excel(file.file)

    db.query(DatasetTraining).delete()

    total = 0

    for _, row in df.iterrows():

        data = DatasetTraining(
            kategori_motivasi=str(
                row["Kategori Motivasi"]
            ),
            kategori_kehadiran=str(
                row["Kategori Kehadiran"]
            ),
            kategori_prestasi=str(
                row["Kategori Prestasi"]
            )
        )

        db.add(data)

        total += 1

    status = db.query(
        DatasetStatus
    ).first()

    if status:

        status.nama_file = file.filename
        status.jumlah_data = total
        status.status = "aktif"

    else:

        status = DatasetStatus(
            nama_file=file.filename,
            jumlah_data=total,
            status="aktif"
        )

        db.add(status)

    db.commit()

    return {
        "message": f"{total} data training berhasil diupload",
        "jumlah_data": total,
        "status": "aktif"
    }


@router.get("/dataset-status")
def dataset_status(
    db: Session = Depends(get_db)
):

    status = db.query(
        DatasetStatus
    ).first()

    if not status:

        return {
            "status": "nonaktif",
            "jumlah_data": 0,
            "nama_file": None
        }

    return {
        "status": status.status,
        "jumlah_data": status.jumlah_data,
        "nama_file": status.nama_file,
        "uploaded_at": status.uploaded_at
    }

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

    hasil = db.query(
        JawabanKuesioner,
        Siswa
    ).join(
        Siswa,
        JawabanKuesioner.siswa_id == Siswa.id
    ).filter(
        JawabanKuesioner.status == "pending"
    ).all()

    data = []

    for item in hasil:

        jawaban = item[0]
        siswa = item[1]

        data.append({
            "id": jawaban.id,
            "siswa_id": siswa.id,
            "nama": siswa.nama,
            "kelas": siswa.kelas,
            "nisn": siswa.nisn,
            "total_score": jawaban.total_score,
            "kategori_motivasi": jawaban.kategori_motivasi,
            "status": jawaban.status
        })

    return data


@router.get("/processed")
def get_processed(
    db: Session = Depends(get_db)
):

    hasil = db.query(
        JawabanKuesioner,
        Siswa
    ).join(
        Siswa,
        JawabanKuesioner.siswa_id == Siswa.id
    ).filter(
        JawabanKuesioner.status == "processed"
    ).all()

    data = []

    for item in hasil:

        jawaban = item[0]
        siswa = item[1]

        data.append({
            "id": jawaban.id,
            "siswa_id": siswa.id,
            "nama": siswa.nama,
            "kelas": siswa.kelas,
            "nisn": siswa.nisn,
            "total_score": jawaban.total_score,
            "kategori_motivasi": jawaban.kategori_motivasi,
            "status": jawaban.status
        })

    return data