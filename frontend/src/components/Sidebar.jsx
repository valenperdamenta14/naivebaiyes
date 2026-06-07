import { Link } from "react-router-dom";

import {
  LayoutDashboard,
  Users,
  ClipboardList,
  BarChart3,
  LogOut,
} from "lucide-react";

export default function Sidebar() {
  return (
    <div className="w-64 bg-slate-900 text-white min-h-screen">
      <div className="p-6 border-b border-slate-700">
        <h1 className="font-bold text-xl">
          Naive Bayes
        </h1>

        <p className="text-sm text-slate-400">
          SMA YP Cerdas Bangsa
        </p>
      </div>

      <nav className="p-4 flex flex-col gap-2">
        <Link
          to="/admin"
          className="flex items-center gap-2 p-3 rounded hover:bg-slate-800"
        >
          <LayoutDashboard size={20} />
          Dashboard
        </Link>

        <Link
          to="/admin/siswa"
          className="flex items-center gap-2 p-3 rounded hover:bg-slate-800"
        >
          <Users size={20} />
          Data Siswa
        </Link>

        <Link
          to="/admin/kuesioner"
          className="flex items-center gap-2 p-3 rounded hover:bg-slate-800"
        >
          <ClipboardList size={20} />
          Kuesioner
        </Link>

        <Link
          to="/admin/hasil"
          className="flex items-center gap-2 p-3 rounded hover:bg-slate-800"
        >
          <BarChart3 size={20} />
          Hasil
        </Link>

        <button
          onClick={() => {
            localStorage.clear();
            window.location.href = "/";
          }}
          className="flex items-center gap-2 p-3 rounded hover:bg-red-700 text-left"
        >
          <LogOut size={20} />
          Logout
        </button>
      </nav>
    </div>
  );
}