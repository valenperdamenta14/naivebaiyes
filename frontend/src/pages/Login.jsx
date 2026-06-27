import { useState } from "react";
import { useNavigate } from "react-router-dom";
import {
  User,
  GraduationCap,
  Lock,
  School,
} from "lucide-react";

import api from "../services/api";
import logo from "../assets/logotutwuri.jpeg";

export default function Login() {
  const [mode, setMode] = useState("admin");

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const [nisn, setNisn] = useState("");
  const [passwordSiswa, setPasswordSiswa] = useState("");

  const navigate = useNavigate();

  // ==========================
  // LOGIN GURU / ADMIN
  // ==========================
  const handleLoginGuru = async (e) => {
    e.preventDefault();

    try {
      const res = await api.post("/auth/login", {
        username,
        password,
      });

      localStorage.setItem("token", res.data.token);
      localStorage.setItem("role", res.data.role);

      navigate("/admin");
    } catch (err) {
      alert("Username atau Password salah");
    }
  };

  // ==========================
  // LOGIN SISWA
  // ==========================
  const handleLoginSiswa = async (e) => {
    e.preventDefault();

    try {
      const res = await api.post("/auth/login-siswa", {
        nisn,
        password: passwordSiswa,
      });

      localStorage.setItem("token", res.data.token);
      localStorage.setItem("role", res.data.role);

      navigate("/siswa");
    } catch (err) {
      alert("NISN atau Password salah");
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-700 via-blue-500 to-cyan-400 flex items-center justify-center px-4">
      <div className="bg-white w-full max-w-md rounded-3xl shadow-2xl p-8">
        {/* Logo */}
        <div className="flex justify-center mb-4">
          <img
            src={logo}
            alt="Logo"
            className="w-24 h-24 object-contain"
          />
        </div>

        {/* Header */}
        <div className="text-center mb-6">
          <h1 className="text-2xl font-bold text-slate-800">
            Sistem Klasifikasi
          </h1>

          <h2 className="text-xl font-semibold text-blue-600">
            Prestasi Akademik
          </h2>

          <p className="text-sm text-gray-500 mt-2">
            Metode Naive Bayes
          </p>
        </div>

        {/* Tab */}
        <div className="flex bg-gray-100 p-1 rounded-xl mb-6">
          <button
            onClick={() => setMode("admin")}
            className={`flex items-center justify-center gap-2 flex-1 py-3 rounded-lg font-medium transition-all ${
              mode === "admin"
                ? "bg-blue-600 text-white shadow"
                : "text-gray-600"
            }`}
          >
            <User size={18} />
            Guru/Admin
          </button>

          <button
            onClick={() => setMode("siswa")}
            className={`flex items-center justify-center gap-2 flex-1 py-3 rounded-lg font-medium transition-all ${
              mode === "siswa"
                ? "bg-green-600 text-white shadow"
                : "text-gray-600"
            }`}
          >
            <GraduationCap size={18} />
            Siswa
          </button>
        </div>

        {/* ========================== */}
        {/* LOGIN GURU */}
        {/* ========================== */}
        {mode === "admin" ? (
          <form onSubmit={handleLoginGuru}>
            <div className="relative mb-4">
              <User
                size={18}
                className="absolute left-3 top-3.5 text-gray-400"
              />

              <input
                type="text"
                placeholder="Username"
                className="w-full border border-gray-300 rounded-xl pl-10 p-3 focus:ring-2 focus:ring-blue-500 outline-none"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
              />
            </div>

            <div className="relative mb-5">
              <Lock
                size={18}
                className="absolute left-3 top-3.5 text-gray-400"
              />

              <input
                type="password"
                placeholder="Password"
                className="w-full border border-gray-300 rounded-xl pl-10 p-3 focus:ring-2 focus:ring-blue-500 outline-none"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>

            <button
              type="submit"
              className="w-full bg-blue-600 hover:bg-blue-700 transition text-white py-3 rounded-xl font-semibold"
            >
              Login Guru/Admin
            </button>
          </form>
        ) : (
          /* ========================== */
          /* LOGIN SISWA */
          /* ========================== */
          <form onSubmit={handleLoginSiswa}>
            <div className="relative mb-4">
              <School
                size={18}
                className="absolute left-3 top-3.5 text-gray-400"
              />

              <input
                type="text"
                placeholder="Masukkan NISN"
                className="w-full border border-gray-300 rounded-xl pl-10 p-3 focus:ring-2 focus:ring-green-500 outline-none"
                value={nisn}
                onChange={(e) => setNisn(e.target.value)}
                required
              />
            </div>

            <div className="relative mb-5">
              <Lock
                size={18}
                className="absolute left-3 top-3.5 text-gray-400"
              />

              <input
                type="password"
                placeholder="Masukkan Password"
                className="w-full border border-gray-300 rounded-xl pl-10 p-3 focus:ring-2 focus:ring-green-500 outline-none"
                value={passwordSiswa}
                onChange={(e) =>
                  setPasswordSiswa(e.target.value)
                }
                required
              />
            </div>

            <button
              type="submit"
              className="w-full bg-green-600 hover:bg-green-700 transition text-white py-3 rounded-xl font-semibold"
            >
              Masuk Sebagai Siswa
            </button>

            <p className="text-xs text-center text-gray-500 mt-4">
              Password default siswa adalah <b>123456</b>
            </p>
          </form>
        )}

        <div className="mt-6 text-center text-xs text-gray-500">
          © 2026 Sistem Klasifikasi Prestasi Akademik
        </div>
      </div>
    </div>
  );
}