from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import DECIMAL
from sqlalchemy import TIMESTAMP
from sqlalchemy.sql import func

from app.database import Base


class Siswa(Base):
    __tablename__ = "siswa"

    id = Column(Integer, primary_key=True, index=True)

    nis = Column(String(50))
    nisn = Column(String(50))

    nama = Column(String(150))

    kelas = Column(String(50))

    jk = Column(String(10))

    kehadiran = Column(DECIMAL(5, 2))

    kategori_kehadiran = Column(String(20))

    created_at = Column(
        TIMESTAMP,
        server_default=func.now()
    )