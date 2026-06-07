from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import ForeignKey

from app.database import Base


class JawabanKuesioner(Base):
    __tablename__ = "jawaban_kuesioner"

    id = Column(Integer, primary_key=True)

    siswa_id = Column(
        Integer,
        ForeignKey("siswa.id")
    )

    q1 = Column(Integer)
    q2 = Column(Integer)
    q3 = Column(Integer)
    q4 = Column(Integer)
    q5 = Column(Integer)

    q6 = Column(Integer)
    q7 = Column(Integer)
    q8 = Column(Integer)
    q9 = Column(Integer)
    q10 = Column(Integer)

    q11 = Column(Integer)
    q12 = Column(Integer)
    q13 = Column(Integer)
    q14 = Column(Integer)
    q15 = Column(Integer)

    q16 = Column(Integer)
    q17 = Column(Integer)
    q18 = Column(Integer)
    q19 = Column(Integer)
    q20 = Column(Integer)

    total_intrinsik = Column(Integer)

    total_ekstrinsik = Column(Integer)

    total_score = Column(Integer)

    kategori_motivasi = Column(String(20))

    status = Column(String(20))