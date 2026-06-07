import { useEffect, useState } from "react";
import Sidebar from "../components/Sidebar";
import api from "../services/api";

import {
  Users,
  ClipboardList,
  CheckCircle,
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

  return (
    <div className="flex min-h-screen bg-gray-100">
      <Sidebar />

      <div className="flex-1 p-6">
        <div className="mb-8">
          <h1 className="text-3xl font-bold">
            Dashboard Guru
          </h1>

          <p className="text-gray-600 mt-2">
            Sistem Klasifikasi Prestasi Akademik
            Menggunakan Metode Naive Bayes
          </p>
        </div>

        <div className="grid md:grid-cols-3 gap-6">
          {cards.map((card, index) => {
            const Icon = card.icon;

            return (
              <div
                key={index}
                className="bg-white rounded-xl shadow p-6"
              >
                <div className="flex justify-between items-center">
                  <div>
                    <h2 className="text-gray-500">
                      {card.title}
                    </h2>

                    <h1 className="text-3xl font-bold mt-2">
                      {card.value}
                    </h1>
                  </div>

                  <div
                    className={`${card.color} p-4 rounded-xl text-white`}
                  >
                    <Icon size={30} />
                  </div>
                </div>
              </div>
            );
          })}
        </div>

        <div className="bg-white rounded-xl shadow mt-8 p-6">
          <h2 className="text-xl font-semibold mb-4">
            Informasi Sistem
          </h2>

          <p className="text-gray-600 leading-7">
            Sistem ini digunakan untuk
            mengklasifikasikan tingkat prestasi akademik
            siswa berdasarkan motivasi belajar dan
            kehadiran menggunakan metode
            Naive Bayes.
          </p>
        </div>
      </div>
    </div>
  );
}