import { useEffect, useState } from "react";
import Sidebar from "../components/Sidebar";
import api from "../services/api";

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

  return (
    <div className="flex">
      <Sidebar />

      <div className="flex-1 p-6">
        <h1 className="text-2xl font-bold mb-6">
          Hasil Klasifikasi
        </h1>

        <div className="bg-white rounded-xl shadow overflow-hidden">
          <table className="w-full">
            <thead className="bg-slate-100">
              <tr>
                <th className="p-3">Nama</th>
                <th className="p-3">Kelas</th>
                <th className="p-3">Motivasi</th>
                <th className="p-3">Kehadiran</th>
                <th className="p-3">Prediksi</th>
                <th className="p-3">Probabilitas</th>
              </tr>
            </thead>

            <tbody>
              {data.map((item) => (
                <tr
                  key={item.id}
                  className="border-t"
                >
                  <td className="p-3">
                    {item.nama}
                  </td>

                  <td className="p-3">
                    {item.kelas}
                  </td>

                  <td className="p-3">
                    {item.kategori_motivasi}
                  </td>

                  <td className="p-3">
                    {item.kategori_kehadiran}
                  </td>

                  <td className="p-3">
                    <span
                      className={`px-3 py-1 rounded-full text-sm ${getBadge(
                        item.hasil_prediksi
                      )}`}
                    >
                      {item.hasil_prediksi}
                    </span>
                  </td>

                  <td className="p-3">
                    {Number(
                      item.probabilitas
                    ).toFixed(4)}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}