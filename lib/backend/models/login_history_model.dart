
class LoginHistoryModel {
  final int loginHistoryId;
  final String userId;
  final String perangkat;
  final String? lokasi;
  final String waktuLogin;

  LoginHistoryModel({
    required this.loginHistoryId,
    required this.userId,
    required this.perangkat,
    this.lokasi,
    required this.waktuLogin,
  });

}
