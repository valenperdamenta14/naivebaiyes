from fastapi import APIRouter
from fastapi import Depends
from fastapi import HTTPException

from sqlalchemy.orm import Session

from app.database import get_db

from app.models.dataset_training import DatasetTraining
from app.models.dataset_status import DatasetStatus
from app.models.siswa import Siswa
from app.models.hasil_klasifikasi import HasilKlasifikasi
from app.models.jawaban_kuesioner import JawabanKuesioner

from app.services.naive_bayes import hitung_naive_bayes

router = APIRouter(
    prefix="/naive-bayes",
    tags=["Naive Bayes"]
)


@router.post("/proses/{jawaban_id}")
def proses_naive_bayes(
    jawaban_id: int,
    db: Session = Depends(get_db)
):
    
    status = db.query(
        DatasetStatus
    ).first()

    if not status or status.status != "aktif":
        raise HTTPException(
            status_code=400,
            detail="Upload dataset training terlebih dahulu"
        )

    jawaban = db.query(
        JawabanKuesioner
    ).filter(
        JawabanKuesioner.id == jawaban_id
    ).first()

    if not jawaban:
        raise HTTPException(
            status_code=404,
            detail="Data kuesioner tidak ditemukan"
        )

    siswa = db.query(
        Siswa
    ).filter(
        Siswa.id == jawaban.siswa_id
    ).first()

    if not siswa:
        raise HTTPException(
            status_code=404,
            detail="Siswa tidak ditemukan"
        )

    dataset = db.query(
        DatasetTraining
    ).all()

    if len(dataset) == 0:
        raise HTTPException(
            status_code=400,
            detail="Dataset training kosong"
        )

    cek_hasil = db.query(
        HasilKlasifikasi
    ).filter(
        HasilKlasifikasi.jawaban_id == jawaban.id
    ).first()

    if cek_hasil:
        raise HTTPException(
            status_code=400,
            detail="Kuesioner sudah diproses"
        )

    hasil = hitung_naive_bayes(
        dataset,
        jawaban.kategori_motivasi,
        siswa.kategori_kehadiran
    )

    simpan = HasilKlasifikasi(
        jawaban_id=jawaban.id,
        kategori_motivasi=jawaban.kategori_motivasi,
        kategori_kehadiran=siswa.kategori_kehadiran,
        hasil_prediksi=hasil["prediksi"],
        probabilitas=hasil["probabilitas"]
    )

    db.add(simpan)

    jawaban.status = "processed"

    db.commit()

    return {
        "message": "Klasifikasi berhasil",
        "hasil": hasil
    }


@router.get("/hasil")
def get_hasil(
    db: Session = Depends(get_db)
):

    data = db.query(
        HasilKlasifikasi,
        JawabanKuesioner,
        Siswa
    ).join(
        JawabanKuesioner,
        HasilKlasifikasi.jawaban_id ==
        JawabanKuesioner.id
    ).join(
        Siswa,
        JawabanKuesioner.siswa_id ==
        Siswa.id
    ).all()

    hasil = []

    for row in data:

        klasifikasi = row[0]
        jawaban = row[1]
        siswa = row[2]

        hasil.append({
            "id": klasifikasi.id,
            "jawaban_id": jawaban.id,
            "nama": siswa.nama,
            "nisn": siswa.nisn,
            "kelas": siswa.kelas,
            "kategori_motivasi":
                klasifikasi.kategori_motivasi,
            "kategori_kehadiran":
                klasifikasi.kategori_kehadiran,
            "hasil_prediksi":
                klasifikasi.hasil_prediksi,
            "probabilitas":
                klasifikasi.probabilitas
        })

    return hasil