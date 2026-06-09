
class LoginHistoryModel {
  final int id;
  final String userId;
  final String perangkat;
  final String? lokasi;
  final String waktuLogin;

  LoginHistoryModel({
    required this.id,
    required this.userId,
    required this.perangkat,
    this.lokasi,
    required this.waktuLogin,
  });

}
