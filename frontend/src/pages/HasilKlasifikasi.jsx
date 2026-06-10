import { useEffect, useState } from "react";
import Sidebar from "../components/Sidebar";
import api from "../services/api";

import {
  BarChart3,
  Trophy,
  TrendingUp,
  Users,
} from "lucide-react";

export default function HasilKlasifikasi() {
  const [data, setData] = useState([]);

  useEffect(() => {
    getData();
  }, []);

  const getData = async () => {
    try {
      const res = await api.get(
        "/naive-bayes/hasil"
      );

      setData(res.data);
    } catch (error) {
      console.log(error);
    }
  };

  const getBadge = (nilai) => {
    if (nilai === "Tinggi") {
      return "bg-green-100 text-green-700";
    }

    if (nilai === "Sedang") {
      return "bg-yellow-100 text-yellow-700";
    }

    return "bg-red-100 text-red-700";
  };

  const tinggi = data.filter(
    (item) =>
      item.hasil_prediksi === "Tinggi"
  ).length;

  const sedang = data.filter(
    (item) =>
      item.hasil_prediksi === "Sedang"
  ).length;

  const rendah = data.filter(
    (item) =>
      item.hasil_prediksi === "Rendah"
  ).length;

  return (
    <div className="flex min-h-screen bg-slate-100">
      <Sidebar />

      <div className="flex-1 p-6">

        {/* Header */}

        <div className="bg-gradient-to-r from-purple-700 via-indigo-600 to-blue-500 rounded-3xl p-8 text-white shadow-xl mb-6">

          <div className="flex items-center gap-4">

            <div className="bg-white/20 p-4 rounded-2xl">
              <BarChart3 size={40} />
            </div>

            <div>
              <h1 className="text-3xl font-bold">
                Hasil Klasifikasi
              </h1>

              <p className="text-purple-100">
                Hasil Prediksi Prestasi Akademik
                Menggunakan Metode Naive Bayes
              </p>
            </div>

          </div>

        </div>

        {/* Tabel */}

        <div className="bg-white rounded-2xl shadow-lg overflow-hidden">

          <div className="p-6 border-b">

            <h2 className="text-2xl font-bold">
              Data Hasil Klasifikasi
            </h2>

            <p className="text-gray-500 mt-1">
              Daftar hasil prediksi prestasi
              akademik siswa
            </p>

          </div>

          <div className="overflow-x-auto">

            <table className="w-full">

              <thead className="bg-slate-100">

                <tr>
                  <th className="p-4 text-left">
                    Nama
                  </th>

                  <th className="p-4 text-left">
                    Kelas
                  </th>

                  <th className="p-4 text-left">
                    Motivasi
                  </th>

                  <th className="p-4 text-left">
                    Kehadiran
                  </th>

                  <th className="p-4 text-left">
                    Prediksi
                  </th>

                  <th className="p-4 text-left">
                    Probabilitas
                  </th>
                </tr>

              </thead>

              <tbody>

                {data.length > 0 ? (

                  data.map((item) => (

                    <tr
                      key={item.id}
                      className="border-t hover:bg-blue-50 transition-all duration-200"
                    >

                      <td className="p-4 font-medium">
                        {item.nama}
                      </td>

                      <td className="p-4">
                        {item.kelas}
                      </td>

                      <td className="p-4">

                        <span className="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm">
                          {
                            item.kategori_motivasi
                          }
                        </span>

                      </td>

                      <td className="p-4">

                        <span className="bg-purple-100 text-purple-700 px-3 py-1 rounded-full text-sm">
                          {
                            item.kategori_kehadiran
                          }
                        </span>

                      </td>

                      <td className="p-4">

                        <span
                          className={`px-3 py-1 rounded-full text-sm font-semibold ${getBadge(
                            item.hasil_prediksi
                          )}`}
                        >
                          {
                            item.hasil_prediksi
                          }
                        </span>

                      </td>

                      <td className="p-4 font-semibold">

                        {Number(
                          item.probabilitas
                        ).toFixed(4)}

                      </td>

                    </tr>

                  ))

                ) : (

                  <tr>

                    <td
                      colSpan="6"
                      className="p-8 text-center text-gray-500"
                    >
                      Belum ada hasil klasifikasi
                    </td>

                  </tr>

                )}

              </tbody>

            </table>

          </div>

        </div>

      </div>
    </div>
  );
}