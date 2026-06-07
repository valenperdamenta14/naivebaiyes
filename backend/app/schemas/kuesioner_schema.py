from pydantic import BaseModel


class KuesionerSchema(BaseModel):
    siswa_id: int

    q1: int
    q2: int
    q3: int
    q4: int
    q5: int

    q6: int
    q7: int
    q8: int
    q9: int
    q10: int

    q11: int
    q12: int
    q13: int
    q14: int
    q15: int

    q16: int
    q17: int
    q18: int
    q19: int
    q20: int