import { useEffect, useState } from "react";
import api from "../services/api";
import Sidebar from "../components/Sidebar";

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
    <div className="flex">
      <Sidebar />

      <div className="flex-1 p-6">

        {/* Upload Dataset */}

        <div className="bg-white rounded-xl shadow p-6 mb-6">

          <h2 className="text-xl font-bold mb-4">
            Dataset Training
          </h2>

          <div className="mb-4">

            <p>
              Status :
              {" "}
              <span
                className={
                  datasetStatus?.status ===
                  "aktif"
                    ? "text-green-600 font-semibold"
                    : "text-red-600 font-semibold"
                }
              >
                {datasetStatus?.status ||
                  "nonaktif"}
              </span>
            </p>

            <p>
              File :
              {" "}
              {datasetStatus?.nama_file ||
                "-"}
            </p>

            <p>
              Jumlah Data :
              {" "}
              {datasetStatus?.jumlah_data ||
                0}
            </p>

          </div>

          <div className="flex gap-3 items-center">

            <input
              key={fileInputKey}
              type="file"
              accept=".xlsx,.xls"
              onChange={(e) =>
                setFile(
                  e.target.files[0]
                )
              }
            />

            <button
              onClick={uploadDataset}
              disabled={loadingUpload}
              className="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded"
            >
              {loadingUpload
                ? "Uploading..."
                : "Upload Dataset"}
            </button>

          </div>

        </div>

        {/* Data Pending */}

        <div className="bg-white rounded-xl shadow overflow-hidden">

          <div className="p-6 border-b">

            <h1 className="text-2xl font-bold">
              Data Kuesioner Pending
            </h1>

          </div>

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
                      disabled={
                        datasetStatus?.status !==
                        "aktif"
                      }
                      onClick={() =>
                        prosesNaiveBayes(
                          item.id
                        )
                      }
                      className={`px-4 py-2 rounded text-white ${
                        datasetStatus?.status ===
                        "aktif"
                          ? "bg-green-600 hover:bg-green-700"
                          : "bg-gray-400 cursor-not-allowed"
                      }`}
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