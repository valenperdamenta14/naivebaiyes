from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String

from app.database import Base


class DatasetTraining(Base):
    __tablename__ = "dataset_training"

    id = Column(Integer, primary_key=True, index=True)

    kategori_motivasi = Column(String(20))

    kategori_kehadiran = Column(String(20))

    kategori_prestasi = Column(String(20))