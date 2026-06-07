from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import ForeignKey

from app.database import Base


class User(Base):
    __tablename__ = "users"

    id = Column(
        Integer,
        primary_key=True,
        index=True
    )

    username = Column(String(100))

    password = Column(String(255))

    role = Column(String(20))

    siswa_id = Column(
        Integer,
        ForeignKey("siswa.id"),
        nullable=True
    )