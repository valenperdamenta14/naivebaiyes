import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../services/api";

import {
  GraduationCap,
  User,
  LogOut,
  CheckCircle,
} from "lucide-react";

export default function DashboardSiswa() {
  const [siswa, setSiswa] = useState(null);

  const [form, setForm] = useState({
    siswa_id: 0,

    q1: 0, q2: 0, q3: 0, q4: 0, q5: 0,
    q6: 0, q7: 0, q8: 0, q9: 0, q10: 0,
    q11: 0, q12: 0, q13: 0, q14: 0, q15: 0,
    q16: 0, q17: 0, q18: 0, q19: 0, q20: 0,
  });

  const navigate = useNavigate();

  useEffect(() => {
    getProfile();
  }, []);

  const getProfile = async () => {
    try {
      const res = await api.get("/auth/me");

      setSiswa(res.data);
      setForm((prev) => ({
        ...prev,
        siswa_id: res.data.siswa_id,
      }));
    } catch (error) {
      localStorage.clear();
      navigate("/");
    }
  };

  const handleLogout = () => {
    localStorage.clear();
    navigate("/");
  };

  const handleChange = (e) => {
    setForm({
      ...form,
      [e.target.name]: Number(e.target.value),
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    for (let i = 1; i <= 20; i++) {
      if (form[`q${i}`] === 0) {
        alert(`Pertanyaan ${i} belum dijawab`);
        return;
      }
    }

    try {
      const res = await api.post(
        "/kuesioner/submit",
        form
      );

      alert(
        `Kuesioner berhasil disimpan\nKategori Motivasi : ${res.data.kategori_motivasi}`
      );

      window.location.reload();

    } catch (error) {
      console.log(error);
      alert("Gagal submit kuesioner");
    }
  };

  const pertanyaan = [
    "Saya ingin memperoleh nilai terbaik dalam setiap mata pelajaran.",
    "Saya merasa puas jika hasil belajar saya meningkat dari sebelumnya.",
    "Saya tetap berusaha memahami materi meskipun sulit.",
    "Saya tidak mudah menyerah ketika mengalami kesulitan belajar.",
    "Saya belajar tanpa harus disuruh oleh orang lain.",
    "Saya memiliki target nilai yang ingin saya capai.",
    "Saya tertarik mempelajari materi lebih dalam dari yang diajarkan.",
    "Saya bertanya kepada guru ketika ada materi yang belum saya pahami.",
    "Saya mengerjakan tugas dengan sungguh-sungguh karena tanggung jawab pribadi.",
    "Saya belajar secara rutin meskipun tidak ada ujian.",
    "Saya belajar agar dapat membanggakan orang tua.",
    "Orang tua saya memberikan dorongan untuk belajar dengan baik.",
    "Saya lebih semangat belajar ketika mendapat pujian dari guru.",
    "Saya ingin mendapatkan peringkat yang baik di kelas.",
    "Saya termotivasi belajar karena adanya persaingan yang sehat di kelas.",
    "Saya lebih giat belajar ketika ada penghargaan atau hadiah.",
    "Lingkungan sekolah membuat saya terdorong untuk belajar lebih baik.",
    "Saya belajar agar tidak dimarahi orang tua atau guru.",
    "Saya ingin diakui sebagai siswa yang berprestasi oleh teman-teman.",
    "Saya merasa terdorong belajar karena tuntutan untuk lulus dengan nilai baik.",
  ];

  const getBadgeColor = (kategori) => {
    if (kategori === "Baik") {
      return "bg-green-100 text-green-700";
    }

    if (kategori === "Cukup") {
      return "bg-yellow-100 text-yellow-700";
    }

    return "bg-red-100 text-red-700";
  };

  if (!siswa) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center bg-slate-100">
        <div className="w-16 h-16 border-4 border-blue-500 border-t-transparent rounded-full animate-spin"></div>

        <p className="mt-4 text-gray-600 font-medium">
          Memuat data siswa...
        </p>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-slate-100 p-6">

      <div className="max-w-6xl mx-auto">

        {/* Header */}

        <div className="bg-gradient-to-r from-blue-700 via-indigo-600 to-cyan-500 rounded-3xl p-8 text-white shadow-xl mb-6">

          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-5">

            <div className="flex items-center gap-4">

              <div className="bg-white/20 p-4 rounded-2xl">
                <GraduationCap size={40} />
              </div>

              <div>

                <h1 className="text-3xl font-bold">
                  Dashboard Siswa
                </h1>

                <p className="text-blue-100 mt-1">
                  Sistem Klasifikasi Prestasi Akademik
                </p>

              </div>

            </div>

            <button
              onClick={handleLogout}
              className="flex items-center gap-2 bg-red-500 hover:bg-red-600 px-5 py-3 rounded-xl transition"
            >
              <LogOut size={18} />
              Logout
            </button>

          </div>

        </div>

        {/* Biodata */}

        <div className="bg-white rounded-2xl shadow-lg p-8 mb-6">

          <div className="flex items-center gap-3 mb-6">

            <User
              size={28}
              className="text-blue-600"
            />

            <h2 className="text-2xl font-bold">
              Biodata Siswa
            </h2>

          </div>

          <div className="grid md:grid-cols-2 gap-6">

            <div>

              <p className="text-gray-500">
                Nama Lengkap
              </p>

              <p className="font-semibold text-lg">
                {siswa.nama}
              </p>

            </div>

            <div>

              <p className="text-gray-500">
                NISN
              </p>

              <p className="font-semibold text-lg">
                {siswa.nisn}
              </p>

            </div>

            <div>

              <p className="text-gray-500">
                Kelas
              </p>

              <p className="font-semibold text-lg">
                {siswa.kelas}
              </p>

            </div>

            <div>

              <p className="text-gray-500">
                Persentase Kehadiran
              </p>

              <p className="font-semibold text-lg">
                {siswa.kehadiran} %
              </p>

            </div>

            <div>

              <p className="text-gray-500 mb-2">
                Kategori Kehadiran
              </p>

              <span
                className={`px-4 py-2 rounded-full text-sm font-semibold ${getBadgeColor(
                  siswa.kategori_kehadiran
                )}`}
              >
                {siswa.kategori_kehadiran}
              </span>

            </div>

          </div>

        </div>

        <div className="bg-white rounded-2xl shadow-lg p-8">

          <h2 className="text-2xl font-bold mb-2">
            Kuesioner Motivasi Belajar
          </h2>

          <p className="text-gray-500 mb-6">
            Silakan isi seluruh pertanyaan berikut.
          </p>

          <form
            onSubmit={handleSubmit}
            className="space-y-5"
          >

            {pertanyaan.map((item, index) => (

              <div
                key={index}
                className="border rounded-2xl p-5"
              >

                <h3 className="font-semibold text-lg mb-4">

                  {index + 1}. {item}

                  <span className="text-red-500 ml-1">
                    *
                  </span>

                </h3>

                <div className="grid md:grid-cols-5 gap-3">

                  {[
                    { value: 5, label: "Sangat Setuju" },
                    { value: 4, label: "Setuju" },
                    { value: 3, label: "Netral" },
                    { value: 2, label: "Tidak Setuju" },
                    { value: 1, label: "Sangat Tidak Setuju" },
                  ].map((opsi) => (

                    <label
                      key={opsi.value}
                      className={`border rounded-xl p-3 cursor-pointer transition hover:border-blue-500 ${
                        form[`q${index + 1}`] === opsi.value
                          ? "border-blue-600 bg-blue-50"
                          : ""
                      }`}
                    >

                      <input
                        type="radio"
                        name={`q${index + 1}`}
                        value={opsi.value}
                        checked={
                          form[`q${index + 1}`] === opsi.value
                        }
                        onChange={handleChange}
                        className="mr-2"
                      />

                      {opsi.label}

                    </label>

                  ))}

                </div>

              </div>

            ))}

            <div className="flex justify-end">

              <button
                type="submit"
                className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-xl"
              >

                <CheckCircle size={20} />
                Submit Kuesioner

              </button>

            </div>

          </form>

        </div>

      </div>

    </div>
  );
}