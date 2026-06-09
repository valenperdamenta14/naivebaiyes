from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import TIMESTAMP
from sqlalchemy.sql import func

from app.database import Base


class DatasetStatus(Base):
    __tablename__ = "dataset_status"

    id = Column(
        Integer,
        primary_key=True,
        index=True
    )

    nama_file = Column(String(255))

    jumlah_data = Column(Integer)

    status = Column(String(20))

    uploaded_at = Column(
        TIMESTAMP,
        server_default=func.now()
    )