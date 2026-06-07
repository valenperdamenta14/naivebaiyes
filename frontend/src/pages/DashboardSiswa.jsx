import { Link } from "react-router-dom";

export default function DashboardSiswa() {
  return (
    <div className="min-h-screen bg-gray-100 p-8">
      <div className="bg-white rounded-xl shadow p-8">
        <h1 className="text-3xl font-bold">
          Dashboard Siswa
        </h1>

        <p className="text-gray-600 mt-2">
          Silakan isi kuesioner motivasi belajar.
        </p>

        <Link
          to="/siswa/kuesioner"
          className="inline-block mt-6 bg-blue-600 text-white px-6 py-3 rounded-lg"
        >
          Isi Kuesioner
        </Link>
      </div>
    </div>
  );
}