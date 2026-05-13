// lib/providers/dashboard_provider.dart
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  // Data inisial 0 (Menunggu Database SQL)
  int _totalProyek = 0;
  List<String> _listNamaProyek = [];

  int get totalProyek => _totalProyek;
  List<String> get listNamaProyek => _listNamaProyek;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // [SARAN TEKNIK: API disebelah sini] 
  // "Saran buat yang ambil teknik API: Letakkan fungsi http.get() di sini 
  // untuk narik data dari database SQL melalui REST API."
  Future<void> loadDataFromDatabase() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1)); // Simulasi
      
      // [SARAN TEKNIK: PARAMETERIZATION / GENERICS disebelah sini]
      // "Saran buat yang ambil Generics: Kita bisa bikin fungsi fetch data yang 
      // bisa nerima tipe data <T> supaya kodenya lebih reusable."
      
      _totalProyek = 0;
      _listNamaProyek = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}