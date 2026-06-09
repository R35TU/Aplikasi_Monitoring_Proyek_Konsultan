
class UserModel {
  final String firebaseUid;
  final String nama;
  final String? username;
  final String peran;
  final int? perusahaanId;
  final String? nomorHp;

  UserModel({
    required this.firebaseUid,
    required this.nama,
    this.username,
    required this.peran,
    this.perusahaanId,
    this.nomorHp,
  });

}
