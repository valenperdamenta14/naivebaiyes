from fastapi import FastAPI

from app.database import Base
from app.database import engine

from app.routes.auth import router as auth_router

from app.routes.siswa import router as siswa_router

from app.routes.dataset import router as dataset_router

from app.models.hasil_klasifikasi import HasilKlasifikasi

from app.routes.naive_bayes import router as nb_router

from app.models.jawaban_kuesioner import JawabanKuesioner

from app.routes.kuesioner import router as kuesioner_router

from app.models.user import User
from app.models.siswa import Siswa
from app.models.dataset_training import DatasetTraining

Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="Naive Bayes Prestasi Akademik"
)

app.include_router(auth_router)

app.include_router(siswa_router)

app.include_router(dataset_router)

app.include_router(nb_router)

app.include_router(kuesioner_router)

@app.get("/")
def root():
    return {
        "message": "Backend berjalan"
    }