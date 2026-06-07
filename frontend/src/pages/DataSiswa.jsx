import { useEffect, useState } from "react";
import api from "../services/api";
import Sidebar from "../components/Sidebar";

export default function DataSiswa() {
  const [siswa, setSiswa] = useState([]);

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

  return (
    <div className="flex">
      <Sidebar />

      <div className="p-6 w-full">
        <h1 className="text-xl font-bold mb-4">
          Data Siswa
        </h1>

        <table className="w-full border">
          <thead>
            <tr className="bg-gray-200">
              <th className="border p-2">NISN</th>
              <th className="border p-2">Nama</th>
              <th className="border p-2">Kelas</th>
              <th className="border p-2">Kehadiran</th>
              <th className="border p-2">Kategori</th>
            </tr>
          </thead>

          <tbody>
            {siswa.map((item) => (
              <tr key={item.id}>
                <td className="border p-2">{item.nisn}</td>
                <td className="border p-2">{item.nama}</td>
                <td className="border p-2">{item.kelas}</td>
                <td className="border p-2">{item.kehadiran}</td>
                <td className="border p-2">{item.kategori_kehadiran}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}