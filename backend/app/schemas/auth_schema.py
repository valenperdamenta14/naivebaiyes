from pydantic import BaseModel


class LoginSchema(BaseModel):
    username: str
    password: str


class LoginSiswaSchema(BaseModel):
    nisn: str