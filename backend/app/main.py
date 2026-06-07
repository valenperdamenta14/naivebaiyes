from fastapi import FastAPI

app = FastAPI(
    title="Naive Bayes Prestasi Akademik"
)

@app.get("/")
def root():
    return {
        "message": "Backend Naive Bayes Berjalan"
    }