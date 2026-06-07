from fastapi import APIRouter
from fastapi import Depends

from sqlalchemy.orm import Session

from app.database import get_db

from app.models.dataset_training import DatasetTraining
from app.models.siswa import Siswa
from app.models.hasil_klasifikasi import HasilKlasifikasi
from app.models.jawaban_kuesioner import JawabanKuesioner

from app.services.naive_bayes import hitung_naive_bayes

router = APIRouter(
    prefix="/naive-bayes",
    tags=["Naive Bayes"]
)


@router.post("/proses/{siswa_id}")
def proses_naive_bayes(
    siswa_id: int,
    db: Session = Depends(get_db)
):

    siswa = db.query(
        Siswa
    ).filter(
        Siswa.id == siswa_id
    ).first()

    if not siswa:
        return {
            "message": "Siswa tidak ditemukan"
        }

    jawaban = db.query(
        JawabanKuesioner
    ).filter(
        JawabanKuesioner.siswa_id == siswa_id
    ).first()

    if not jawaban:
        return {
            "message": "Kuesioner belum diisi"
        }

    dataset = db.query(
        DatasetTraining
    ).all()

    if len(dataset) == 0:
        return {
            "message": "Dataset training kosong"
        }

    cek_hasil = db.query(
        HasilKlasifikasi
    ).filter(
        HasilKlasifikasi.siswa_id == siswa.id
    ).first()

    if cek_hasil:
        return {
            "message": "Siswa sudah diproses"
        }

    hasil = hitung_naive_bayes(
        dataset,
        jawaban.kategori_motivasi,
        siswa.kategori_kehadiran
    )

    simpan = HasilKlasifikasi(
        siswa_id=siswa.id,
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
        Siswa
    ).join(
        Siswa,
        HasilKlasifikasi.siswa_id == Siswa.id
    ).all()

    hasil = []

    for item in data:

        klasifikasi = item[0]
        siswa = item[1]

        hasil.append({
            "id": klasifikasi.id,
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