import { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

import api from "../services/api";

export default function DashboardSiswa() {
  const [siswa, setSiswa] = useState(null);

  const navigate = useNavigate();

  useEffect(() => {
    getProfile();
  }, []);

  const getProfile = async () => {
    try {
      const res = await api.get("/auth/me");

      setSiswa(res.data);
    } catch (error) {
      localStorage.clear();
      navigate("/");
    }
  };

  const handleLogout = () => {
    localStorage.clear();
    navigate("/");
  };

  if (!siswa) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        Loading...
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-slate-100 p-8">

      <div className="max-w-5xl mx-auto">

        <div className="bg-white rounded-xl shadow-lg p-8 mb-6">

          <div className="flex justify-between items-center">

            <div>
              <h1 className="text-3xl font-bold">
                Dashboard Siswa
              </h1>

              <p className="text-gray-500 mt-2">
                Selamat datang di Sistem Klasifikasi Prestasi Akademik
              </p>
            </div>

            <button
              onClick={handleLogout}
              className="bg-red-600 text-white px-4 py-2 rounded"
            >
              Logout
            </button>

          </div>

        </div>

        <div className="bg-white rounded-xl shadow-lg p-8">

          <h2 className="text-xl font-semibold mb-6">
            Biodata Siswa
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">

            <div>
              <p className="text-gray-500">
                Nama
              </p>

              <p className="font-semibold">
                {siswa.nama}
              </p>
            </div>

            <div>
              <p className="text-gray-500">
                NISN
              </p>

              <p className="font-semibold">
                {siswa.nisn}
              </p>
            </div>

            <div>
              <p className="text-gray-500">
                Kelas
              </p>

              <p className="font-semibold">
                {siswa.kelas}
              </p>
            </div>

            <div>
              <p className="text-gray-500">
                Kehadiran
              </p>

              <p className="font-semibold">
                {siswa.kehadiran} %
              </p>
            </div>

            <div>
              <p className="text-gray-500">
                Kategori Kehadiran
              </p>

              <p className="font-semibold">
                {siswa.kategori_kehadiran}
              </p>
            </div>

          </div>

          <Link
            to="/siswa/kuesioner"
            className="inline-block mt-8 bg-blue-600 text-white px-6 py-3 rounded-lg"
          >
            Isi Kuesioner
          </Link>

        </div>

      </div>

    </div>
  );
}