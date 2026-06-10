import { useEffect, useState } from "react";
import Sidebar from "../components/Sidebar";
import api from "../services/api";

import {
  Users,
  ClipboardList,
  CheckCircle,
  GraduationCap,
  CalendarDays,
} from "lucide-react";

export default function DashboardAdmin() {
  const [summary, setSummary] = useState({
    total_siswa: 0,
    pending: 0,
    processed: 0,
  });

  useEffect(() => {
    getSummary();
  }, []);

  const getSummary = async () => {
    try {
      const res = await api.get("/dashboard/summary");
      setSummary(res.data);
    } catch (error) {
      console.log(error);
    }
  };

  const cards = [
    {
      title: "Total Siswa",
      value: summary.total_siswa,
      icon: Users,
      color: "bg-blue-500",
    },
    {
      title: "Pending",
      value: summary.pending,
      icon: ClipboardList,
      color: "bg-yellow-500",
    },
    {
      title: "Diproses",
      value: summary.processed,
      icon: CheckCircle,
      color: "bg-green-500",
    },
  ];

  const today = new Date().toLocaleDateString("id-ID", {
    weekday: "long",
    day: "numeric",
    month: "long",
    year: "numeric",
  });

  return (
    <div className="flex min-h-screen bg-slate-100">
      <Sidebar />

      <div className="flex-1 p-6">

        {/* Header */}
        <div className="bg-gradient-to-r from-blue-700 to-cyan-500 rounded-3xl p-8 text-white shadow-lg mb-8">
          <div className="flex justify-between items-center flex-wrap gap-4">

            <div>
              <h1 className="text-3xl font-bold">
                Selamat Datang Guru 👋
              </h1>

              <p className="mt-2 text-blue-100">
                Sistem Klasifikasi Prestasi Akademik
                Menggunakan Metode Naive Bayes
              </p>
            </div>

            <div className="flex items-center gap-2 bg-white/20 px-4 py-2 rounded-xl">
              <CalendarDays size={20} />
              <span>{today}</span>
            </div>

          </div>
        </div>

        {/* Statistik */}
        <div className="grid md:grid-cols-3 gap-6">
          {cards.map((card, index) => {
            const Icon = card.icon;

            return (
              <div
                key={index}
                className="bg-white rounded-2xl shadow-md hover:shadow-xl transition-all duration-300 p-6"
              >
                <div className="flex justify-between items-center">

                  <div>
                    <p className="text-gray-500 text-sm">
                      {card.title}
                    </p>

                    <h2 className="text-4xl font-bold mt-2 text-slate-800">
                      {card.value}
                    </h2>
                  </div>

                  <div
                    className={`${card.color} p-4 rounded-2xl text-white`}
                  >
                    <Icon size={30} />
                  </div>

                </div>
              </div>
            );
          })}
        </div>

        {/* Informasi Sistem */}
        <div className="bg-white rounded-2xl shadow-md mt-8 p-8">

          <div className="flex items-center gap-3 mb-4">
            <GraduationCap
              size={30}
              className="text-blue-600"
            />

            <h2 className="text-2xl font-bold text-slate-800">
              Informasi Sistem
            </h2>
          </div>

          <p className="text-gray-600 leading-8 text-justify">
            Sistem ini digunakan untuk membantu guru
            dalam mengklasifikasikan tingkat prestasi
            akademik siswa berdasarkan data motivasi
            belajar dan kehadiran siswa menggunakan
            metode Naive Bayes. Hasil klasifikasi dapat
            digunakan sebagai bahan evaluasi untuk
            meningkatkan kualitas pembelajaran dan
            pemantauan perkembangan akademik siswa.
          </p>

        </div>
      </div>
    </div>
  );
}