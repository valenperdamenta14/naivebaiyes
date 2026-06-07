import { useState } from "react";
import api from "../services/api";

export default function Kuesioner() {
  const [form, setForm] = useState({
    siswa_id: "",
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

  const handleChange = (e) => {
    setForm({
      ...form,
      [e.target.name]: Number(e.target.value),
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const res = await api.post(
        "/kuesioner/submit",
        form
      );

      alert(
        `Kategori Motivasi : ${res.data.kategori_motivasi}`
      );
    } catch (error) {
      console.log(error);
      alert("Gagal submit");
    }
  };

  const pertanyaan = [
    "Saya ingin memperoleh nilai terbaik dalam setiap mata pelajaran",
    "Saya merasa puas jika hasil belajar saya meningkat dari sebelumnya",
    "Saya tetap berusaha memahami materi meskipun sulit",
    "Saya tidak mudah menyerah ketika mengalami kesulitan belajar",
    "Saya belajar tanpa harus disuruh orang lain",
    "Saya memiliki target nilai yang ingin saya capai",
    "Saya tertarik mempelajari materi lebih dalam",
    "Saya bertanya kepada guru ketika belum paham",
    "Saya mengerjakan tugas dengan sungguh-sungguh",
    "Saya belajar secara rutin meskipun tidak ada ujian",

    "Saya belajar agar membanggakan orang tua",
    "Orang tua saya memberikan dorongan belajar",
    "Saya lebih semangat ketika mendapat pujian guru",
    "Saya ingin mendapatkan peringkat yang baik",
    "Saya termotivasi karena persaingan sehat",
    "Saya lebih giat ketika ada penghargaan",
    "Lingkungan sekolah mendorong saya belajar",
    "Saya belajar agar tidak dimarahi",
    "Saya ingin diakui sebagai siswa berprestasi",
    "Saya terdorong untuk lulus dengan nilai baik",
  ];

  return (
    <div className="min-h-screen bg-gray-100 p-8">
      <form
        onSubmit={handleSubmit}
        className="bg-white p-8 rounded-xl shadow"
      >
        <h1 className="text-3xl font-bold mb-6">
          Kuesioner Motivasi Belajar
        </h1>

        <div className="mb-6">
          <label>Siswa ID</label>

          <input
            type="number"
            className="w-full border p-2 rounded"
            onChange={(e) =>
              setForm({
                ...form,
                siswa_id: Number(e.target.value),
              })
            }
          />
        </div>

        {pertanyaan.map((item, index) => (
          <div
            key={index}
            className="mb-6 border-b pb-4"
          >
            <h3 className="font-medium mb-3">
              {index + 1}. {item}
            </h3>

            <select
              name={`q${index + 1}`}
              onChange={handleChange}
              className="border p-2 rounded"
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
          className="bg-blue-600 text-white px-6 py-3 rounded-lg"
        >
          Submit Kuesioner
        </button>
      </form>
    </div>
  );
}