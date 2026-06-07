import { useEffect, useState } from "react";
import api from "../services/api";
import Sidebar from "../components/Sidebar";

export default function DataKuesioner() {
  const [data, setData] = useState([]);

  useEffect(() => {
    getPending();
  }, []);

  const getPending = async () => {
    try {
      const res = await api.get(
        "/kuesioner/pending"
      );

      setData(res.data);
    } catch (error) {
      console.log(error);
    }
  };

  const prosesNaiveBayes = async (
    jawabanId
  ) => {
    try {
      const res = await api.post(
        `/naive-bayes/proses/${jawabanId}`
      );

      alert(res.data.message);

      getPending();
    } catch (error) {
      console.log(error);
      alert("Gagal proses");
    }
  };

  return (
    <div className="flex">
      <Sidebar />

      <div className="flex-1 p-6">
        <h1 className="text-2xl font-bold mb-6">
          Data Kuesioner Pending
        </h1>

        <div className="bg-white rounded-xl shadow overflow-hidden">
          <table className="w-full">
            <thead className="bg-slate-100">
              <tr>
                <th className="p-3 text-left">
                  Nama
                </th>

                <th className="p-3 text-left">
                  NISN
                </th>

                <th className="p-3 text-left">
                  Kelas
                </th>

                <th className="p-3 text-left">
                  Total Score
                </th>

                <th className="p-3 text-left">
                  Motivasi
                </th>

                <th className="p-3 text-left">
                  Aksi
                </th>
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
                    {item.nisn}
                  </td>

                  <td className="p-3">
                    {item.kelas}
                  </td>

                  <td className="p-3">
                    {item.total_score}
                  </td>

                  <td className="p-3">
                    {item.kategori_motivasi}
                  </td>

                  <td className="p-3">
                    <button
                      onClick={() =>
                        prosesNaiveBayes(
                          item.id
                        )
                      }
                      className="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded"
                    >
                      Proses
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          {data.length === 0 && (
            <div className="p-6 text-center text-gray-500">
              Tidak ada data pending
            </div>
          )}
        </div>
      </div>
    </div>
  );
}