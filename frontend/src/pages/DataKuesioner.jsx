import { useEffect, useState } from "react";
import api from "../services/api";
import Sidebar from "../components/Sidebar";

import {
  Database,
  Upload,
  FileSpreadsheet,
  ClipboardList,
  PlayCircle,
} from "lucide-react";

export default function DataKuesioner() {
  const [data, setData] = useState([]);
  const [datasetStatus, setDatasetStatus] = useState(null);
  const [file, setFile] = useState(null);
  const [loadingUpload, setLoadingUpload] = useState(false);

  useEffect(() => {
    getPending();
    getDatasetStatus();
  }, []);

  const getPending = async () => {
    try {
      const res = await api.get("/kuesioner/pending");

      setData(res.data);
    } catch (error) {
      console.log(error);
    }
  };

  const getDatasetStatus = async () => {
    try {
      const res = await api.get(
        "/dataset/status"
      );

      console.log("Dataset:", res.data);

      setDatasetStatus(res.data);
    } catch (error) {
      console.log(error);
    }
  };

  const uploadDataset = async () => {
    if (!file) {
      alert("Pilih file terlebih dahulu");
      return;
    }

    try {
      setLoadingUpload(true);

      const formData = new FormData();

      formData.append("file", file);

      const res = await api.post(
        "/dataset/import",
        formData,
        {
          headers: {
            "Content-Type":
              "multipart/form-data",
          },
        }
      );

      alert(res.data.message);

      setFile(null);

      setFileInputKey(Date.now());

      await getDatasetStatus();

      await getPending();
    } catch (error) {
      console.log(error);

      alert(
        error.response?.data?.detail ||
          "Upload gagal"
      );
    } finally {
      setLoadingUpload(false);
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

      console.log("Response :", error.response);
      console.log("Data :", error.response?.data);

      alert(
        JSON.stringify(error.response?.data) ||
        "Gagal proses"
      );
    }
  };

  const [fileInputKey, setFileInputKey] =
  useState(Date.now());

  return (
    <div className="flex min-h-screen bg-slate-100">
      <Sidebar />

      <div className="flex-1 p-6">

        {/* Header */}

        <div className="bg-gradient-to-r from-indigo-700 via-blue-600 to-cyan-500 rounded-3xl p-8 text-white shadow-xl mb-6">

          <div className="flex items-center gap-4">

            <div className="bg-white/20 p-4 rounded-2xl">
              <Database size={40} />
            </div>

            <div>
              <h1 className="text-3xl font-bold">
                Data Kuesioner
              </h1>

              <p className="text-blue-100">
                Proses Klasifikasi Prestasi Akademik
                Menggunakan Metode Naive Bayes
              </p>
            </div>

          </div>

        </div>

        {/* Dataset */}

        <div className="bg-white rounded-2xl shadow-lg p-6 mb-6">

          <div className="flex items-center gap-3 mb-5">

            <FileSpreadsheet
              size={28}
              className="text-green-600"
            />

            <h2 className="text-xl font-bold">
              Dataset Training
            </h2>

          </div>

          <div className="grid md:grid-cols-3 gap-4 mb-5">

            <div>
              <p className="text-sm text-gray-500">
                Status
              </p>

              <span
                className={`inline-flex px-3 py-1 rounded-full text-sm font-semibold mt-2 ${
                  datasetStatus?.status === "aktif"
                    ? "bg-green-100 text-green-700"
                    : "bg-red-100 text-red-700"
                }`}
              >
                {datasetStatus?.status ||
                  "nonaktif"}
              </span>
            </div>

            <div>
              <p className="text-sm text-gray-500">
                Nama File
              </p>

              <p className="font-medium mt-2">
                {datasetStatus?.nama_file ||
                  "-"}
              </p>
            </div>

            <div>
              <p className="text-sm text-gray-500">
                Jumlah Data
              </p>

              <p className="font-bold text-lg mt-2">
                {datasetStatus?.jumlah_data ||
                  0}
              </p>
            </div>

          </div>

          <div className="flex flex-col md:flex-row gap-3">

            <input
              key={fileInputKey}
              type="file"
              accept=".xlsx,.xls"
              onChange={(e) =>
                setFile(e.target.files[0])
              }
              className="border rounded-xl p-3 flex-1"
            />

            <button
              onClick={uploadDataset}
              disabled={loadingUpload}
              className="flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-5 py-3 rounded-xl"
            >
              <Upload size={18} />

              {loadingUpload
                ? "Uploading..."
                : "Upload Dataset"}
            </button>

          </div>

        </div>

        {/* Data Pending */}

        <div className="bg-white rounded-2xl shadow-lg overflow-hidden">

          <div className="p-6 border-b">

            <div className="flex items-center gap-3">

              <ClipboardList
                size={28}
                className="text-blue-600"
              />

              <h2 className="text-2xl font-bold">
                Data Kuesioner Pending
              </h2>

            </div>

          </div>

          <div className="overflow-x-auto">

            <table className="w-full">

              <thead className="bg-slate-100">

                <tr>
                  <th className="p-4 text-left">
                    Nama
                  </th>

                  <th className="p-4 text-left">
                    NISN
                  </th>

                  <th className="p-4 text-left">
                    Kelas
                  </th>

                  <th className="p-4 text-left">
                    Total Score
                  </th>

                  <th className="p-4 text-left">
                    Motivasi
                  </th>

                  <th className="p-4 text-center">
                    Aksi
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

                      <td className="p-4">
                        {item.nama}
                      </td>

                      <td className="p-4">
                        {item.nisn}
                      </td>

                      <td className="p-4">
                        {item.kelas}
                      </td>

                      <td className="p-4 font-semibold">
                        {item.total_score}
                      </td>

                      <td className="p-4">

                        <span className="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm">
                          {item.kategori_motivasi}
                        </span>

                      </td>

                      <td className="p-4 text-center">

                        <button
                          disabled={
                            datasetStatus?.status !==
                            "aktif"
                          }
                          onClick={() =>
                            prosesNaiveBayes(
                              item.id
                            )
                          }
                          className={`inline-flex items-center gap-2 px-4 py-2 rounded-xl text-white ${
                            datasetStatus?.status ===
                            "aktif"
                              ? "bg-green-600 hover:bg-green-700"
                              : "bg-gray-400 cursor-not-allowed"
                          }`}
                        >
                          <PlayCircle size={18} />
                          Proses
                        </button>

                      </td>

                    </tr>

                  ))

                ) : (

                  <tr>
                    <td
                      colSpan="6"
                      className="p-8 text-center text-gray-500"
                    >
                      Tidak ada data pending
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