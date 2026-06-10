import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import {
  ClipboardList,
  User,
  CheckCircle,
} from "lucide-react";

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
  <div className="min-h-screen bg-slate-100 py-8 px-4">

    <div className="max-w-4xl mx-auto">

      {/* Form */}

      <form
        onSubmit={handleSubmit}
        className="space-y-5"
      >

        {pertanyaan.map((item, index) => (

          <div
            key={index}
            className="bg-white rounded-2xl shadow-lg p-6 border-l-4 border-blue-500"
          >

            <h3 className="font-semibold text-lg mb-4">

              {index + 1}. {item}

              <span className="text-red-500 ml-1">
                *
              </span>

            </h3>

            <div className="grid md:grid-cols-5 gap-3">

              {[
                {
                  value: 5,
                  label: "Sangat Setuju",
                },
                {
                  value: 4,
                  label: "Setuju",
                },
                {
                  value: 3,
                  label: "Netral",
                },
                {
                  value: 2,
                  label: "Tidak Setuju",
                },
                {
                  value: 1,
                  label:
                    "Sangat Tidak Setuju",
                },
              ].map((opsi) => (

                <label
                  key={opsi.value}
                  className={`border rounded-xl p-3 cursor-pointer transition hover:border-blue-500 ${
                    form[
                      `q${index + 1}`
                    ] === opsi.value
                      ? "border-blue-600 bg-blue-50"
                      : ""
                  }`}
                >

                  <input
                    type="radio"
                    name={`q${index + 1}`}
                    value={opsi.value}
                    checked={
                      form[
                        `q${index + 1}`
                      ] === opsi.value
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

        {/* Submit */}

        <div className="bg-white rounded-2xl shadow-lg p-6 flex justify-between items-center">

          <div className="text-gray-500">

            Pastikan semua pertanyaan
            telah dijawab.

          </div>

          <button
            type="submit"
            className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-8 py-3 rounded-xl transition"
          >
            <CheckCircle size={20} />
            Submit Kuesioner
          </button>

        </div>

      </form>

    </div>

  </div>
);
}