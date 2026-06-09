from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.database import Base
from app.database import engine

from app.routes.auth import router as auth_router
from app.routes.siswa import router as siswa_router
from app.models.dataset_status import DatasetStatus
from app.routes.dataset import router as dataset_router
from app.models.hasil_klasifikasi import HasilKlasifikasi
from app.routes.naive_bayes import router as nb_router
from app.models.jawaban_kuesioner import JawabanKuesioner
from app.routes.kuesioner import router as kuesioner_router
from app.routes.dashboard import router as dashboard_router
from app.routes.dataset_training import router as dataset_router

from app.models.user import User
from app.models.siswa import Siswa
from app.models.dataset_training import DatasetTraining

Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="Naive Bayes Prestasi Akademik"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:5173",
        "http://127.0.0.1:5173"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth_router)
app.include_router(siswa_router)
app.include_router(dataset_router)
app.include_router(nb_router)
app.include_router(kuesioner_router)
app.include_router(dashboard_router)


@app.get("/")
def root():
    return {
        "message": "Backend berjalan"
    }