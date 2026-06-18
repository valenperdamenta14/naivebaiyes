import { useEffect, useState } from "react";
import Sidebar from "../components/Sidebar";
import api from "../services/api";

import {
  Users,
  Plus,
  Upload,
  Pencil,
  Trash2,
  FileSpreadsheet,
} from "lucide-react";

export default function DataSiswa() {
  const [siswa, setSiswa] = useState([]);

  const [showTambah, setShowTambah] =
    useState(false);

  const [importLoading, setImportLoading] =
    useState(false);

  const [showEdit, setShowEdit] =
    useState(false);

  const [showImport, setShowImport] =
    useState(false);

  const [selectedFile, setSelectedFile] =
    useState(null);

  const [search, setSearch] = useState("");

  const initialForm = {
    id: "",
    nis: "",
    nisn: "",
    nama: "",
    kelas: "",
    jk: "L",
    kehadiran: "",
  };

  const [form, setForm] =
    useState(initialForm);

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

  const filteredSiswa = siswa.filter(
    (item) =>
      item.nama
        ?.toLowerCase()
        .includes(search.toLowerCase()) ||
      item.nis?.includes(search) ||
      item.nisn?.includes(search)
  );

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
      const res = await api.post(
        "/siswa/",
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

      setShowTambah(false);
      resetForm();
      getData();
    } catch (error) {
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
      const res = await api.delete(
        `/siswa/${id}`
      );

      alert(res.data.message);

      getData();
    } catch (error) {
      alert(
        error.response?.data?.detail ||
          "Gagal menghapus data"
      );
    }
  };

  const importExcel = async (e) => {
    e.preventDefault();

    if (!selectedFile) {
      return alert(
        "Pilih file Excel terlebih dahulu"
      );
    }

    const formData = new FormData();

    formData.append("file", selectedFile);

    try {
      setImportLoading(true);

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
      alert("Gagal import data");
    } finally {
      setImportLoading(false);
    }
  };

  return (
    <div className="flex bg-slate-100 min-h-screen">
      <Sidebar />

      <div className="flex-1 p-6">

        {/* Header */}
        <div className="bg-gradient-to-r from-blue-700 via-blue-600 to-cyan-500 rounded-3xl p-8 text-white shadow-xl mb-6">

          <div className="flex items-center gap-5">

            <div className="bg-white/20 p-4 rounded-2xl">
              <Users size={42} />
            </div>

            <div>
              <h1 className="text-3xl font-bold">
                Data Siswa
              </h1>

              <p className="text-blue-100 mt-1">
                Kelola data siswa SMA YP
                Cerdas Bangsa
              </p>
            </div>

          </div>

        </div>    

        {/* Search & Action */}
        <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4 mb-6">

          <div className="flex flex-wrap gap-3">

            <button
              onClick={() => setShowImport(true)}
              className="flex items-center gap-2 bg-emerald-600 hover:bg-emerald-700 text-white px-5 py-3 rounded-xl transition"
            >
              <Upload size={18} />
              Import Excel
            </button>

            <button
              onClick={() => {
                resetForm();
                setShowTambah(true);
              }}
              className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-5 py-3 rounded-xl transition"
            >
              <Plus size={18} />
              Tambah Siswa
            </button>

          </div>

        </div>

        {/* Table */}
        <div className="overflow-x-auto rounded-xl border">

          <table className="w-full">

            <thead className="bg-slate-100">

              <tr>
                <th className="p-4 text-left">No</th>
                <th className="p-4 text-left">NIS</th>
                <th className="p-4 text-left">NISN</th>
                <th className="p-4 text-left">Nama</th>
                <th className="p-4 text-left">Kelas</th>
                <th className="p-4 text-left">JK</th>
                <th className="p-4 text-left">Kehadiran</th>
                <th className="p-4 text-left">Kategori</th>
                <th className="p-4 text-center">Aksi</th>
              </tr>

            </thead>

            <tbody>

              {filteredSiswa.length > 0 ? (

                filteredSiswa.map(
                  (item, index) => (
                    <tr
                      key={item.id}
                      className="border-t hover:bg-blue-50 transition-all duration-200"
                    >
                      <td className="p-4">
                        {index + 1}
                      </td>

                      <td className="p-4 font-medium">
                        {item.nis}
                      </td>

                      <td className="p-4">
                        {item.nisn}
                      </td>

                      <td className="p-4">
                        {item.nama}
                      </td>

                      <td className="p-4">
                        {item.kelas}
                      </td>

                      <td className="p-4">
                        {item.jk}
                      </td>

                      <td className="p-4">
                        {item.kehadiran}%
                      </td>

                      <td className="p-4">

                        <span
                          className={`inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold ${
                            item.kategori_kehadiran ===
                            "Baik"
                              ? "bg-green-100 text-green-700"
                              : item.kategori_kehadiran ===
                                "Cukup"
                              ? "bg-yellow-100 text-yellow-700"
                              : "bg-red-100 text-red-700"
                          }`}
                        >
                          {item.kategori_kehadiran}
                        </span>

                      </td>

                      <td className="p-4">

                        <div className="flex justify-center gap-2">

                          <button
                            onClick={() =>
                              bukaEdit(item)
                            }
                            className="bg-yellow-500 hover:bg-yellow-600 text-white p-2 rounded-lg transition"
                          >
                            <Pencil size={16} />
                          </button>

                          <button
                            onClick={() =>
                              hapusSiswa(item.id)
                            }
                            className="bg-red-600 hover:bg-red-700 text-white p-2 rounded-lg transition"
                          >
                            <Trash2 size={16} />
                          </button>

                        </div>

                      </td>

                    </tr>
                  )
                )

              ) : (

                <tr>
                  <td
                    colSpan="9"
                    className="p-8 text-center text-gray-500"
                  >
                    Data siswa tidak ditemukan
                  </td>
                </tr>

              )}

            </tbody>

          </table>

        </div>

      </div>

      {/* Modal Tambah */}
      {showTambah && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">

          <div className="bg-white w-full max-w-xl rounded-3xl shadow-2xl overflow-hidden">

            <div className="bg-gradient-to-r from-blue-600 to-cyan-500 p-5 text-white">
              <h2 className="text-2xl font-bold">
                Tambah Data Siswa
              </h2>

              <p className="text-blue-100 text-sm">
                Lengkapi informasi siswa
              </p>
            </div>

            <form
              onSubmit={tambahSiswa}
              className="p-6 space-y-4"
            >

              <div className="grid md:grid-cols-2 gap-4">

                <div>
                  <label className="block text-sm font-medium mb-1">
                    NIS
                  </label>

                  <input
                    type="text"
                    name="nis"
                    value={form.nis}
                    onChange={handleChange}
                    className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-blue-500 outline-none"
                    required
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-1">
                    NISN
                  </label>

                  <input
                    type="text"
                    name="nisn"
                    value={form.nisn}
                    onChange={handleChange}
                    className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-blue-500 outline-none"
                    required
                  />
                </div>

              </div>

              <div>
                <label className="block text-sm font-medium mb-1">
                  Nama Siswa
                </label>

                <input
                  type="text"
                  name="nama"
                  value={form.nama}
                  onChange={handleChange}
                  className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-blue-500 outline-none"
                  required
                />
              </div>

              <div className="grid md:grid-cols-2 gap-4">

                <div>
                  <label className="block text-sm font-medium mb-1">
                    Kelas
                  </label>

                  <input
                    type="text"
                    name="kelas"
                    value={form.kelas}
                    onChange={handleChange}
                    className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-blue-500 outline-none"
                    required
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-1">
                    Jenis Kelamin
                  </label>

                  <select
                    name="jk"
                    value={form.jk}
                    onChange={handleChange}
                    className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-blue-500 outline-none"
                  >
                    <option value="L">
                      Laki-laki
                    </option>

                    <option value="P">
                      Perempuan
                    </option>
                  </select>
                </div>

              </div>

              <div>
                <label className="block text-sm font-medium mb-1">
                  Kehadiran (%)
                </label>

                <input
                  type="number"
                  step="0.01"
                  name="kehadiran"
                  value={form.kehadiran}
                  onChange={handleChange}
                  className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-blue-500 outline-none"
                  required
                />
              </div>

              <div className="flex justify-end gap-3 pt-4">

                <button
                  type="button"
                  onClick={() => {
                    setShowTambah(false);
                    resetForm();
                  }}
                  className="px-5 py-3 rounded-xl border hover:bg-gray-100"
                >
                  Batal
                </button>

                <button
                  type="submit"
                  className="bg-blue-600 hover:bg-blue-700 text-white px-5 py-3 rounded-xl"
                >
                  Simpan Data
                </button>

              </div>

            </form>

          </div>

        </div>
      )}

      {/* Modal Edit */}
      {showEdit && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">

          <div className="bg-white w-full max-w-xl rounded-3xl shadow-2xl overflow-hidden">

            <div className="bg-gradient-to-r from-amber-500 to-orange-500 p-5 text-white">
              <h2 className="text-2xl font-bold">
                Edit Data Siswa
              </h2>

              <p className="text-amber-100 text-sm">
                Perbarui informasi siswa
              </p>
            </div>

            <form
              onSubmit={editSiswa}
              className="p-6 space-y-4"
            >

              <div className="grid md:grid-cols-2 gap-4">

                <div>
                  <label className="block text-sm font-medium mb-1">
                    NIS
                  </label>

                  <input
                    type="text"
                    name="nis"
                    value={form.nis}
                    onChange={handleChange}
                    className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-amber-500 outline-none"
                    required
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-1">
                    NISN
                  </label>

                  <input
                    type="text"
                    name="nisn"
                    value={form.nisn}
                    onChange={handleChange}
                    className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-amber-500 outline-none"
                    required
                  />
                </div>

              </div>

              <div>
                <label className="block text-sm font-medium mb-1">
                  Nama Siswa
                </label>

                <input
                  type="text"
                  name="nama"
                  value={form.nama}
                  onChange={handleChange}
                  className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-amber-500 outline-none"
                  required
                />
              </div>

              <div className="grid md:grid-cols-2 gap-4">

                <div>
                  <label className="block text-sm font-medium mb-1">
                    Kelas
                  </label>

                  <input
                    type="text"
                    name="kelas"
                    value={form.kelas}
                    onChange={handleChange}
                    className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-amber-500 outline-none"
                    required
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium mb-1">
                    Jenis Kelamin
                  </label>

                  <select
                    name="jk"
                    value={form.jk}
                    onChange={handleChange}
                    className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-amber-500 outline-none"
                  >
                    <option value="L">Laki-laki</option>
                    <option value="P">Perempuan</option>
                  </select>
                </div>

              </div>

              <div>
                <label className="block text-sm font-medium mb-1">
                  Kehadiran (%)
                </label>

                <input
                  type="number"
                  step="0.01"
                  name="kehadiran"
                  value={form.kehadiran}
                  onChange={handleChange}
                  className="w-full border rounded-xl p-3 focus:ring-2 focus:ring-amber-500 outline-none"
                  required
                />
              </div>

              <div className="flex justify-end gap-3 pt-4">

                <button
                  type="button"
                  onClick={() => {
                    setShowEdit(false);
                    resetForm();
                  }}
                  className="px-5 py-3 rounded-xl border hover:bg-gray-100"
                >
                  Batal
                </button>

                <button
                  type="submit"
                  className="bg-amber-500 hover:bg-amber-600 text-white px-5 py-3 rounded-xl"
                >
                  Update Data
                </button>

              </div>

            </form>

          </div>

        </div>
      )}

      {/* Modal Import */}
      {showImport && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">

          <div className="bg-white w-full max-w-lg rounded-3xl shadow-2xl overflow-hidden">

            <div className="bg-gradient-to-r from-emerald-600 to-green-500 p-5 text-white">

              <div className="flex items-center gap-3">
                <FileSpreadsheet size={28} />

                <div>
                  <h2 className="text-2xl font-bold">
                    Import Data Siswa
                  </h2>

                  <p className="text-green-100 text-sm">
                    Upload file Excel siswa
                  </p>
                </div>
              </div>

            </div>

            <div className="p-6 space-y-5">

              <a
                href="/template_siswa.xlsx"
                download
                className="inline-flex items-center gap-2 bg-slate-700 hover:bg-slate-800 text-white px-4 py-3 rounded-xl"
              >
                <FileSpreadsheet size={18} />
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
                className="w-full border rounded-xl p-3"
              />

              {selectedFile && (
                <div className="bg-green-50 border border-green-200 rounded-xl p-3 text-sm text-green-700">
                  File dipilih:
                  {" "}
                  <strong>
                    {selectedFile.name}
                  </strong>
                </div>
              )}

              <div className="flex justify-end gap-3">

                <button
                  onClick={() => {
                    setShowImport(false);
                    setSelectedFile(null);
                  }}
                  className="px-5 py-3 rounded-xl border hover:bg-gray-100"
                >
                  Batal
                </button>

                <button
                  onClick={importExcel}
                  disabled={importLoading}
                  className={`px-5 py-3 rounded-xl text-white ${
                    importLoading
                      ? "bg-gray-400 cursor-not-allowed"
                      : "bg-emerald-600 hover:bg-emerald-700"
                  }`}
                >
                  {importLoading
                    ? "Mengimpor..."
                    : "Import Data"}
                </button>

              </div>

            </div>

          </div>

        </div>
      )}

      {importLoading && (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-[9999]">
          <div className="bg-white rounded-3xl p-8 w-full max-w-md text-center shadow-2xl">

            <div className="flex justify-center mb-5">
              <div className="w-16 h-16 border-4 border-emerald-500 border-t-transparent rounded-full animate-spin"></div>
            </div>

            <h3 className="text-xl font-bold text-slate-800 mb-2">
              Sedang Mengimpor Data
            </h3>

            <p className="text-slate-500">
              Mohon tunggu sebentar, data siswa sedang diproses.
              Jangan menutup halaman ini.
            </p>

          </div>
        </div>
      )}

          </div>
        );
      }