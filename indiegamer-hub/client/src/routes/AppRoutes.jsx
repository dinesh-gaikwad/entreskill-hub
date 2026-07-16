import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Home from '../pages/home/Home';
import Login from '../pages/auth/Login';
import Register from '../pages/auth/Register';
import GameDetail from '../pages/games/GameDetail';
import AdminDashboard from '../pages/admin/AdminDashboard';

export default function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/login" element={<Login />} />
      <Route path="/register" element={<Register />} />
      <Route path="/games/:id" element={<GameDetail />} />
      <Route path="/admin" element={<AdminDashboard />} />
    </Routes>
  );
}
