import 'package:flutter/material.dart';
import '../../backend/models/user_model.dart';
import '../../backend/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum AuthState { unauthenticated, loading, authenticated, error }

class AuthProvider extends ChangeNotifier {
  final UserRepository userRepository;

  AuthState _state = AuthState.unauthenticated;
  UserModel? _currentUser;
  String? _errorMessage;

  AuthProvider(this.userRepository);

  AuthState get state => _state;
  UserModel? get currentUser => _currentUser;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password, {bool rememberMe = false}) async {
    // PRECONDITION: Hanya boleh login dari state UNAUTHENTICATED atau ERROR
    assert(_state == AuthState.unauthenticated || _state == AuthState.error,
        'login() hanya valid dari state UNAUTHENTICATED atau ERROR, saat ini: $_state');

    _state = AuthState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await userRepository.authenticate(email, password);
      if (user != null) {
        _currentUser = user;
        _state = AuthState.authenticated;
        
        if (rememberMe) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('remembered_user_id', user.id);
        }

        notifyListeners();
        return true;
      } else {
        _state = AuthState.error;
        _errorMessage = 'Email atau password salah';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _state = AuthState.error;
      _errorMessage = 'Terjadi kesalahan sistem: $e';
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    // PRECONDITION: Hanya boleh logout dari state AUTHENTICATED
    assert(_state == AuthState.authenticated,
        'logout() hanya valid dari state AUTHENTICATED, saat ini: $_state');

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('remembered_user_id');

    _currentUser = null;
    _state = AuthState.unauthenticated;
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> checkRememberedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('remembered_user_id');
    
    if (userId != null) {
      final user = await userRepository.getById(userId);
      if (user != null) {
        _currentUser = user;
        _state = AuthState.authenticated;
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  void updateCurrentUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  void retry() {
    // PRECONDITION: Hanya boleh retry dari state ERROR
    assert(_state == AuthState.error,
        'retry() hanya valid dari state ERROR, saat ini: $_state');

    _state = AuthState.unauthenticated;
    _errorMessage = null;
    notifyListeners();
  }
}
