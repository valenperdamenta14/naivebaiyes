import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

import api from "../services/api";

export default function Kuesioner() {
  const navigate = useNavigate();

  const [siswa, setSiswa] = useState(null);

  const [form, setForm] = useState({
    siswa_id: 0,

    q1: 0,
    q2: 0,
    q3: 0,
    q4: 0,
    q5: 0,

    q6: 0,
    q7: 0,
    q8: 0,
    q9: 0,
    q10: 0,

    q11: 0,
    q12: 0,
    q13: 0,
    q14: 0,
    q15: 0,

    q16: 0,
    q17: 0,
    q18: 0,
    q19: 0,
    q20: 0,
  });

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
      navigate("/");
    }
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

      navigate("/siswa");

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

        <form
          onSubmit={handleSubmit}
          className="bg-white rounded-xl shadow-lg p-8"
        >

          <h1 className="text-3xl font-bold mb-2">
            Kuesioner Motivasi Belajar
          </h1>

          <p className="text-gray-500 mb-8">
            Nama : {siswa.nama}
          </p>

          {pertanyaan.map((item, index) => (

            <div
              key={index}
              className="border-b py-5"
            >

              <h3 className="font-medium mb-3">
                {index + 1}. {item}
              </h3>

              <select
                name={`q${index + 1}`}
                value={form[`q${index + 1}`]}
                onChange={handleChange}
                className="border rounded px-3 py-2 w-full"
              >
                <option value="0">
                  Pilih Jawaban
                </option>

                <option value="5">
                  Sangat Setuju
                </option>

                <option value="4">
                  Setuju
                </option>

                <option value="3">
                  Netral
                </option>

                <option value="2">
                  Tidak Setuju
                </option>

                <option value="1">
                  Sangat Tidak Setuju
                </option>
              </select>

            </div>

          ))}

          <button
            type="submit"
            className="mt-8 bg-blue-600 text-white px-8 py-3 rounded-lg"
          >
            Submit Kuesioner
          </button>

        </form>

      </div>

    </div>
  );
}