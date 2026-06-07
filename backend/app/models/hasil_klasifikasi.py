from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import Float
from sqlalchemy import ForeignKey
from sqlalchemy import TIMESTAMP
from sqlalchemy.sql import func

from app.database import Base


class HasilKlasifikasi(Base):
    __tablename__ = "hasil_klasifikasi"

    id = Column(
        Integer,
        primary_key=True,
        index=True
    )

    jawaban_id = Column(
        Integer,
        ForeignKey("jawaban_kuesioner.id")
    )

    kategori_motivasi = Column(
        String(20)
    )

    kategori_kehadiran = Column(
        String(20)
    )

    hasil_prediksi = Column(
        String(50)
    )

    probabilitas = Column(
        Float
    )

    created_at = Column(
        TIMESTAMP,
        server_default=func.now()
    )