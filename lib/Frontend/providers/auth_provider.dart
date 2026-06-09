// =============================================================
// FILE   : lib/Frontend/providers/auth_provider.dart
// TEKNIK : Automata (Finite State Machine) + Defensive Programming
// =============================================================

import 'package:flutter/material.dart';
import '../../backend/services/auth_service.dart';
import '../../backend/models/user_model.dart';

enum AuthState { unauthenticated, loading, authenticated, error }

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  
  AuthState _state = AuthState.unauthenticated;
  String _errorMessage = '';
  UserModel? _user;

  AuthProvider(this._authService);

  AuthState get state => _state;
  String get errorMessage => _errorMessage;
  UserModel? get user => _user;

  Future<void> login(String email, String password) async {
    assert(_state == AuthState.unauthenticated || _state == AuthState.error, 'login() hanya dari UNAUTHENTICATED atau ERROR');
    
    _state = AuthState.loading;
    notifyListeners();

    try {
      _user = await _authService.signIn(email, password);
      _state = AuthState.authenticated;
    } catch (e) {
      _errorMessage = e.toString();
      _state = AuthState.error;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    assert(_state == AuthState.authenticated, 'logout() hanya dari AUTHENTICATED');
    
    await _authService.signOut();
    _user = null;
    _state = AuthState.unauthenticated;
    notifyListeners();
  }

  void retry() {
    assert(_state == AuthState.error, 'retry() hanya dari ERROR');
    _state = AuthState.unauthenticated;
    _errorMessage = '';
    notifyListeners();
  }
}
