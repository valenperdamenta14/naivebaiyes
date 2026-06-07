import { BrowserRouter, Routes, Route } from "react-router-dom";

import Login from "./pages/Login";
import DashboardAdmin from "./pages/DashboardAdmin";
import DashboardSiswa from "./pages/DashboardSiswa";
import DataSiswa from "./pages/DataSiswa";
import Kuesioner from "./pages/Kuesioner";
import DataKuesioner from "./pages/DataKuesioner";
import HasilKlasifikasi from "./pages/HasilKlasifikasi";

import ProtectedRoute from "./components/ProtectedRoute";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>

        <Route
          path="/"
          element={<Login />}
        />

        <Route
          path="/admin"
          element={
            <ProtectedRoute>
              <DashboardAdmin />
            </ProtectedRoute>
          }
        />

        <Route
          path="/siswa"
          element={
            <ProtectedRoute>
              <DashboardSiswa />
            </ProtectedRoute>
          }
        />

        <Route
          path="/admin/siswa"
          element={
            <ProtectedRoute>
              <DataSiswa />
            </ProtectedRoute>
          }
        />

        <Route
          path="/siswa/kuesioner"
          element={
            <ProtectedRoute>
              <Kuesioner />
            </ProtectedRoute>
          }
        />

        <Route
          path="/admin/kuesioner"
          element={
            <ProtectedRoute>
              <DataKuesioner />
            </ProtectedRoute>
          }
        />

        <Route
          path="/admin/hasil"
          element={
            <ProtectedRoute>
              <HasilKlasifikasi />
            </ProtectedRoute>
          }
        />

      </Routes>
    </BrowserRouter>
  );
}