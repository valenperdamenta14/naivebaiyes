import { Link } from "react-router-dom";
import api from "../services/api";

import {
  LayoutDashboard,
  Users,
  ClipboardList,
  BarChart3,
  LogOut,
  GraduationCap,
} from "lucide-react";

export default function Sidebar() {
  return (
    <aside className="w-64 bg-slate-900 text-white h-screen sticky top-0 shadow-xl flex flex-col">

      {/* Header */}
      <div className="p-6 border-b border-slate-700">
        <div className="flex items-center gap-3">
          <GraduationCap
            size={36}
            className="text-cyan-400"
          />

          <div>
            <h1 className="font-bold text-xl">
              Naive Bayes
            </h1>

            <p className="text-sm text-slate-400">
              SMA YP Cerdas Bangsa
            </p>
          </div>
        </div>
      </div>

      {/* Menu */}
      <nav className="flex-1 p-4 flex flex-col gap-2">

        <Link
          to="/admin"
          className="flex items-center gap-3 p-3 rounded-xl hover:bg-slate-800 transition"
        >
          <LayoutDashboard size={20} />
          Dashboard
        </Link>

        <Link
          to="/admin/siswa"
          className="flex items-center gap-3 p-3 rounded-xl hover:bg-slate-800 transition"
        >
          <Users size={20} />
          Data Siswa
        </Link>

        <Link
          to="/admin/kuesioner"
          className="flex items-center gap-3 p-3 rounded-xl hover:bg-slate-800 transition"
        >
          <ClipboardList size={20} />
          Data Kuesioner
        </Link>

        <Link
          to="/admin/hasil"
          className="flex items-center gap-3 p-3 rounded-xl hover:bg-slate-800 transition"
        >
          <BarChart3 size={20} />
          Hasil Klasifikasi
        </Link>

      </nav>

      {/* Logout */}
      <div className="p-4 border-t border-slate-700">
        <button
          onClick={async () => {
            try {
              await api.post("/dataset/deactivate");
            } catch (error) {
              console.log(error);
            }

            localStorage.clear();
            window.location.href = "/";
          }}
          className="w-full flex items-center gap-3 p-3 rounded-xl bg-red-600 hover:bg-red-700 transition"
        >
          <LogOut size={20} />
          Logout
        </button>
      </div>

    </aside>
  );
}