import { useState } from "react";
import { useNavigate } from "react-router-dom";

import api from "../services/api";

export default function Login() {
  const [mode, setMode] = useState("admin");

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const [nisn, setNisn] = useState("");

  const navigate = useNavigate();

  const handleLoginGuru = async (e) => {
    e.preventDefault();

    try {

      const res = await api.post(
        "/auth/login",
        {
          username,
          password,
        }
      );

      localStorage.setItem(
        "token",
        res.data.token
      );

      localStorage.setItem(
        "role",
        res.data.role
      );

      localStorage.setItem(
        "role",
        res.data.role
      );

      navigate("/admin");

    } catch (err) {
      alert("Login guru gagal");
    }
  };

  const handleLoginSiswa = async (e) => {
    e.preventDefault();

    try {

      const res = await api.post(
        "/auth/login-siswa",
        {
          nisn
        }
      );

      localStorage.setItem(
        "token",
        res.data.token
      );

      localStorage.setItem(
        "role",
        res.data.role
      );

      navigate("/siswa");

    } catch (err) {
      alert("NISN tidak ditemukan");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-slate-100">

      <div className="bg-white w-[420px] rounded-xl shadow-lg p-8">

        <h1 className="text-3xl font-bold text-center mb-6">
          Sistem Klasifikasi Prestasi Akademik
        </h1>

        <div className="flex gap-2 mb-6">

          <button
            onClick={() => setMode("admin")}
            className={`flex-1 py-2 rounded ${
              mode === "admin"
                ? "bg-blue-600 text-white"
                : "bg-gray-200"
            }`}
          >
            Guru/Admin
          </button>

          <button
            onClick={() => setMode("siswa")}
            className={`flex-1 py-2 rounded ${
              mode === "siswa"
                ? "bg-green-600 text-white"
                : "bg-gray-200"
            }`}
          >
            Siswa
          </button>

        </div>

        {mode === "admin" ? (
          <form onSubmit={handleLoginGuru}>

            <input
              type="text"
              placeholder="Username"
              className="w-full border rounded p-3 mb-3"
              value={username}
              onChange={(e) =>
                setUsername(e.target.value)
              }
            />

            <input
              type="password"
              placeholder="Password"
              className="w-full border rounded p-3 mb-4"
              value={password}
              onChange={(e) =>
                setPassword(e.target.value)
              }
            />

            <button className="w-full bg-blue-600 text-white py-3 rounded">
              Login Guru
            </button>

          </form>
        ) : (
          <form onSubmit={handleLoginSiswa}>

            <input
              type="text"
              placeholder="Masukkan NISN"
              className="w-full border rounded p-3 mb-4"
              value={nisn}
              onChange={(e) =>
                setNisn(e.target.value)
              }
            />

            <button className="w-full bg-green-600 text-white py-3 rounded">
              Masuk Sebagai Siswa
            </button>

          </form>
        )}

      </div>

    </div>
  );
}