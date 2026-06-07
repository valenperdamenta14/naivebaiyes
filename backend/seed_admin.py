from app.database import SessionLocal

from app.models.user import User

from app.utils.security import hash_password

db = SessionLocal()

cek = db.query(User).filter(
    User.username == "admin"
).first()

if not cek:

    admin = User(
        username="admin",
        password=hash_password("admin123"),
        role="admin"
    )

    db.add(admin)
    db.commit()

    print("Admin berhasil dibuat")

else:
    print("Admin sudah ada")

db.close()