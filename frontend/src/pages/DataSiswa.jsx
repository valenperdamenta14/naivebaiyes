import { useEffect, useState } from "react";
import Sidebar from "../components/Sidebar";
import api from "../services/api";

export default function DataSiswa() {
  const [siswa, setSiswa] = useState([]);

  const [showTambah, setShowTambah] = useState(false);
  const [showEdit, setShowEdit] = useState(false);
  const [showImport, setShowImport] = useState(false);

  const [selectedFile, setSelectedFile] = useState(null);

  const initialForm = {
    id: "",
    nis: "",
    nisn: "",
    nama: "",
    kelas: "",
    jk: "L",
    kehadiran: "",
  };

  const [form, setForm] = useState(initialForm);

  useEffect(() => {
    getData();
  }, []);

  const getData = async () => {
    try {
      const res = await api.get("/siswa/");
      setSiswa(res.data);
    } catch (error) {
      console.log(error);
    }
  };

  const handleChange = (e) => {
    setForm({
      ...form,
      [e.target.name]: e.target.value,
    });
  };

  const resetForm = () => {
    setForm(initialForm);
  };

  const tambahSiswa = async (e) => {
    e.preventDefault();

    try {
      const res = await api.post("/siswa/", {
        nis: form.nis,
        nisn: form.nisn,
        nama: form.nama,
        kelas: form.kelas,
        jk: form.jk,
        kehadiran: form.kehadiran,
      });

      alert(res.data.message);

      setShowTambah(false);
      resetForm();
      getData();
    } catch (error) {
      console.log(error);

      alert(
        error.response?.data?.detail ||
          "Gagal menambahkan siswa"
      );
    }
  };

  const bukaEdit = (item) => {
    setForm({
      id: item.id,
      nis: item.nis,
      nisn: item.nisn,
      nama: item.nama,
      kelas: item.kelas,
      jk: item.jk,
      kehadiran: item.kehadiran,
    });

    setShowEdit(true);
  };

  const editSiswa = async (e) => {
    e.preventDefault();

    try {
      const res = await api.put(
        `/siswa/${form.id}`,
        {
          nis: form.nis,
          nisn: form.nisn,
          nama: form.nama,
          kelas: form.kelas,
          jk: form.jk,
          kehadiran: form.kehadiran,
        }
      );

      alert(res.data.message);

      setShowEdit(false);
      resetForm();
      getData();
    } catch (error) {
      console.log(error);

      alert(
        error.response?.data?.detail ||
          "Gagal mengubah data"
      );
    }
  };

  const hapusSiswa = async (id) => {
    const konfirmasi = window.confirm(
      "Yakin ingin menghapus siswa ini?"
    );

    if (!konfirmasi) return;

    try {
      const res = await api.delete(`/siswa/${id}`);

      alert(res.data.message);

      getData();
    } catch (error) {
      console.log(error);

      alert(
        error.response?.data?.detail ||
          "Gagal menghapus data"
      );
    }
  };

  const importExcel = async (e) => {
    e.preventDefault();

    if (!selectedFile) {
      return alert("Pilih file Excel terlebih dahulu");
    }

    const formData = new FormData();

    formData.append("file", selectedFile);

    try {
      const res = await api.post(
        "/siswa/import",
        formData,
        {
          headers: {
            "Content-Type":
              "multipart/form-data",
          },
        }
      );

      alert(res.data.message);

      setShowImport(false);
      setSelectedFile(null);

      getData();
    } catch (error) {
      console.log(error);

      alert("Gagal import data");
    }
  };

    return (
    <div className="flex bg-slate-100 min-h-screen">
      <Sidebar />

      <div className="flex-1 p-6">
        <div className="bg-white rounded-xl shadow p-6">

          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mb-6">
            <div>
              <h1 className="text-2xl font-bold">
                Data Siswa
              </h1>

              <p className="text-gray-500 text-sm">
                Kelola data siswa SMA YP Cerdas Bangsa
              </p>
            </div>

            <div className="flex gap-3">

              <button
                onClick={() => setShowImport(true)}
                className="bg-emerald-600 hover:bg-emerald-700 text-white px-4 py-2 rounded-lg"
              >
                Import Excel
              </button>

              <button
                onClick={() => {
                  resetForm();
                  setShowTambah(true);
                }}
                className="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg"
              >
                Tambah Siswa
              </button>

            </div>
          </div>

          <div className="overflow-x-auto rounded-lg border">

            <table className="w-full">

              <thead className="bg-slate-100">
                <tr>
                  <th className="p-3 text-left">No</th>
                  <th className="p-3 text-left">NIS</th>
                  <th className="p-3 text-left">NISN</th>
                  <th className="p-3 text-left">Nama</th>
                  <th className="p-3 text-left">Kelas</th>
                  <th className="p-3 text-left">JK</th>
                  <th className="p-3 text-left">Kehadiran</th>
                  <th className="p-3 text-left">Kategori</th>
                  <th className="p-3 text-center">Aksi</th>
                </tr>
              </thead>

              <tbody>

                {siswa.length > 0 ? (

                  siswa.map((item, index) => (

                    <tr
                      key={item.id}
                      className="border-t hover:bg-slate-50"
                    >
                      <td className="p-3">
                        {index + 1}
                      </td>

                      <td className="p-3">
                        {item.nis}
                      </td>

                      <td className="p-3">
                        {item.nisn}
                      </td>

                      <td className="p-3">
                        {item.nama}
                      </td>

                      <td className="p-3">
                        {item.kelas}
                      </td>

                      <td className="p-3">
                        {item.jk}
                      </td>

                      <td className="p-3">
                        {item.kehadiran}%
                      </td>

                      <td className="p-3">

                        <span
                          className={`px-3 py-1 rounded-full text-sm ${
                            item.kategori_kehadiran === "Baik"
                              ? "bg-green-100 text-green-700"
                              : item.kategori_kehadiran === "Cukup"
                              ? "bg-yellow-100 text-yellow-700"
                              : "bg-red-100 text-red-700"
                          }`}
                        >
                          {item.kategori_kehadiran}
                        </span>

                      </td>

                      <td className="p-3">
                        <div className="flex justify-center gap-2">

                          <button
                            onClick={() => bukaEdit(item)}
                            className="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded"
                          >
                            Edit
                          </button>

                          <button
                            onClick={() => hapusSiswa(item.id)}
                            className="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded"
                          >
                            Hapus
                          </button>

                        </div>
                      </td>

                    </tr>

                  ))

                ) : (

                  <tr>
                    <td
                      colSpan="9"
                      className="p-6 text-center text-gray-500"
                    >
                      Data siswa belum tersedia
                    </td>
                  </tr>

                )}

              </tbody>

            </table>

          </div>
        </div>
      </div>
            {/* Modal Tambah */}
      {showTambah && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-white w-full max-w-lg rounded-xl p-6 shadow-xl">
            <h2 className="text-xl font-bold mb-4">
              Tambah Siswa
            </h2>

            <form
              onSubmit={tambahSiswa}
              className="space-y-4"
            >
              <input
                type="text"
                name="nis"
                placeholder="NIS"
                value={form.nis}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <input
                type="text"
                name="nisn"
                placeholder="NISN"
                value={form.nisn}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <input
                type="text"
                name="nama"
                placeholder="Nama"
                value={form.nama}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <input
                type="text"
                name="kelas"
                placeholder="Kelas"
                value={form.kelas}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <select
                name="jk"
                value={form.jk}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
              >
                <option value="L">
                  Laki-laki
                </option>

                <option value="P">
                  Perempuan
                </option>
              </select>

              <input
                type="number"
                step="0.01"
                name="kehadiran"
                placeholder="Kehadiran (%)"
                value={form.kehadiran}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <div className="flex justify-end gap-3 pt-2">
                <button
                  type="button"
                  onClick={() => {
                    setShowTambah(false);
                    resetForm();
                  }}
                  className="px-4 py-2 rounded-lg border"
                >
                  Batal
                </button>

                <button
                  className="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg"
                >
                  Simpan
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Modal Edit */}
      {showEdit && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-white w-full max-w-lg rounded-xl p-6 shadow-xl">
            <h2 className="text-xl font-bold mb-4">
              Edit Siswa
            </h2>

            <form
              onSubmit={editSiswa}
              className="space-y-4"
            >
              <input
                type="text"
                name="nis"
                value={form.nis}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <input
                type="text"
                name="nisn"
                value={form.nisn}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <input
                type="text"
                name="nama"
                value={form.nama}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <input
                type="text"
                name="kelas"
                value={form.kelas}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <select
                name="jk"
                value={form.jk}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
              >
                <option value="L">
                  Laki-laki
                </option>

                <option value="P">
                  Perempuan
                </option>
              </select>

              <input
                type="number"
                step="0.01"
                name="kehadiran"
                value={form.kehadiran}
                onChange={handleChange}
                className="w-full border rounded-lg p-3"
                required
              />

              <div className="flex justify-end gap-3 pt-2">
                <button
                  type="button"
                  onClick={() => {
                    setShowEdit(false);
                    resetForm();
                  }}
                  className="px-4 py-2 rounded-lg border"
                >
                  Batal
                </button>

                <button
                  className="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded-lg"
                >
                  Update
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Modal Import */}
      {showImport && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-white w-full max-w-md rounded-xl p-6 shadow-xl">

            <h2 className="text-xl font-bold mb-4">
              Import Data Siswa
            </h2>

            <div className="space-y-4">

              <a
                href="/template_siswa.xlsx"
                download
                className="inline-block bg-slate-700 hover:bg-slate-800 text-white px-4 py-2 rounded-lg"
              >
                Download Template Excel
              </a>

              <input
                type="file"
                accept=".xlsx,.xls"
                onChange={(e) =>
                  setSelectedFile(
                    e.target.files[0]
                  )
                }
                className="w-full border rounded-lg p-3"
              />

              <div className="flex justify-end gap-3">

                <button
                  onClick={() => {
                    setShowImport(false);
                    setSelectedFile(null);
                  }}
                  className="px-4 py-2 border rounded-lg"
                >
                  Batal
                </button>

                <button
                  onClick={importExcel}
                  className="bg-emerald-600 hover:bg-emerald-700 text-white px-4 py-2 rounded-lg"
                >
                  Import
                </button>

              </div>

            </div>
          </div>
        </div>
      )}
    </div>
  );
}